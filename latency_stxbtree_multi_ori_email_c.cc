#include "microbench.hh"
#include "stx/btree_multimap.h"
#include "stx/btree.h"

int main() {
  std::ifstream infile_load("workloads/email_loadc_zipf_int_100M.dat");
  std::ifstream infile_txn("workloads/email_txnsc_zipf_int_100M.dat");
  std::ofstream outfile_latency_read("latencies/stxbtree_multi_ori_email_read_update.csv");

  std::string op;
  std::string key;

  std::vector<GenericKey<31> > init_keys;
  std::vector<int> ops; //INSERT = 0, READ = 1
  std::vector<GenericKey<31> > keys;
  std::vector<uint64_t> values;

  std::string insert("INSERT");
  std::string read("READ");

  int count = 0;
  uint64_t value = 0;
  GenericKey<31> key_gen;
  int value_count = 0;
  void *base_ptr = malloc(8);
  uint64_t base = (uint64_t)(base_ptr);
  free(base_ptr);

  while (count < INIT_LIMIT * VALUES_PER_KEY) {
    value = base + rand();
    values.push_back(value);
    count++;
  }

  count = 0;
  while ((count < INIT_LIMIT) && infile_txn.good()) {
    infile_load >> op >> key;
    if (op.compare(insert) != 0) {
      std::cout << "READING LOAD FILE FAIL!\n";
      return -1;
    }
    key_gen.setFromString(key);
    init_keys.push_back(key_gen);
    count++;
  }

  count = 0;
  while ((count < LIMIT) && infile_txn.good()) {
    infile_txn >> op >> key;
    if (op.compare(read) == 0) {
      ops.push_back(1);
      key_gen.setFromString(key);
      keys.push_back(key_gen);
    }
    else {
      std::cout << "UNRECOGNIZED CMD!\n";
      return -1;
    }
    count++;
  }


  //==============================================================================
  typedef AllocatorTracker<std::pair<const GenericKey<31>, uint64_t> > AllocatorType;
  typedef stx::btree_multimap<GenericKey<31>, uint64_t, GenericComparator<31>, stx::btree_default_map_traits<GenericKey<31>, uint64_t>, AllocatorType> BtreeType;

  int64_t memory = 0;
  AllocatorType *alloc = new AllocatorType(&memory);
  BtreeType *stxbtree = new BtreeType(GenericComparator<31>(), (*alloc));
  BtreeType::const_iterator stxbtree_keyIter;
  std::pair<BtreeType::iterator, BtreeType::iterator> iter_pair;

  //INITIALIZE----------------------
  count = 0;
  timespec start_time;
  timespec end_time;
  while (count < (int)init_keys.size()) {
    for (int i = 0; i < VALUES_PER_KEY; i++) {
      //**********************************************************************************************
      stxbtree->insert(init_keys[count], values[value_count]);
      //**********************************************************************************************
      value_count++;
    }
    count++;
  }

  //READ/UPDATE TEST----------------
  int txn_num = 0;
  uint64_t sum = 0;
  while ((txn_num < LIMIT) && (txn_num < (int)ops.size())) {
    if (ops[txn_num] == 1) { //READ
      clock_gettime(CLOCK_REALTIME, &start_time);
    //************************************************
      iter_pair = stxbtree->equal_range(keys[txn_num]);
    //************************************************
      if (iter_pair.first == iter_pair.second) {
	std::cout << "READ FAIL\n";
	return -1;
      }
      while (iter_pair.first != iter_pair.second) {
	sum += iter_pair.first->second;
	iter_pair.first++;
      }
      clock_gettime(CLOCK_REALTIME, &end_time);
      outfile_latency_read << ((end_time.tv_sec - start_time.tv_sec) * 1000000000 + (end_time.tv_nsec - start_time.tv_nsec)) << "\n";
    }
    else {
      std::cout << "UNRECOGNIZED CMD!\n";
      return -1;
    }
    txn_num++;
  }

  return 0;
}
