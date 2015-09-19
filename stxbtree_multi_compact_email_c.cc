#include "microbench.hh"
#include "stx-compact-multi/btree_multimap.h"
#include "stx-compact-multi/btree.h"

int main() {
  std::ifstream infile_load("workloads/email_loadc_zipf_int_100M.dat");
  std::ifstream infile_txn("workloads/email_txnsc_zipf_int_100M.dat");

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
  BtreeType::hybrid_iterator stxbtree_keyIter;
  std::pair<BtreeType::hybrid_iterator, BtreeType::hybrid_iterator> iter_pair;

  //INITIALIZE----------------------
  count = 0;
  while (count < (int)init_keys.size()) {
    for (int i = 0; i < VALUES_PER_KEY; i++) {
      //**********************************************************************************************
      stxbtree->insert(init_keys[count], values[value_count]);
      //**********************************************************************************************
      value_count++;
    }
    count++;
  }

  std::cout << "stxbtree multi compact email " << "memory " << (memory + stxbtree->get_static_data_size() + 0.0)/1000000 << "\n"; //compact

  //READ/UPDATE TEST----------------
  double start_time = get_now();
  int txn_num = 0;
  uint64_t sum = 0;
  while ((txn_num < LIMIT) && (txn_num < (int)ops.size())) {
    if (ops[txn_num] == 1) { //READ
    //*******************************************************
      iter_pair = stxbtree->equal_range_hybrid(keys[txn_num]);
    //*******************************************************
      if (iter_pair.first == iter_pair.second) {
	std::cout << "READ FAIL\n";
	return -1;
      }
      while (iter_pair.first != iter_pair.second) {
	sum += iter_pair.first->second;
	iter_pair.first++;
      }
    }
    else {
      std::cout << "UNRECOGNIZED CMD!\n";
      return -1;
    }
    txn_num++;
  }
  double end_time = get_now();
  double tput = txn_num / (end_time - start_time) / 1000000; //Mops/sec

  std::cout << "stxbtree multi compact email " << "read " << (tput + (sum - sum)) << "\n";

  return 0;
}
