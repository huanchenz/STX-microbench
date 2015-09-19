#include "microbench.hh"
#include "stx/btree_multimap.h"
#include "stx/btree.h"

int main() {
  std::ifstream infile_load("workloads/mono_inc_loada_zipf_int_100M.dat");
  std::ifstream infile_txn("workloads/mono_inc_txnsa_zipf_int_100M.dat");
  std::ofstream outfile_latency_insert("latencies/stxbtree_multi_ori_monoinc_int_insert.csv");
  std::ofstream outfile_latency_read_update("latencies/stxbtree_multi_ori_monoinc_int_read_update.csv");

  std::string op;
  uint64_t key;

  std::vector<uint64_t> init_keys;
  std::vector<int> ops; //INSERT = 0, READ = 1, UPDATE = 2
  std::vector<uint64_t> keys;
  std::vector<uint64_t> values;

  std::string insert("INSERT");
  std::string read("READ");
  std::string update("UPDATE");

  int count = 0;
  uint64_t value = 0;
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
    init_keys.push_back(key);
    count++;
  }

  count = 0;
  while ((count < LIMIT) && infile_txn.good()) {
    infile_txn >> op >> key;
    if (op.compare(read) == 0) {
      ops.push_back(1);
      keys.push_back(key);
    }
    else if (op.compare(update) == 0) {
      ops.push_back(2);
      keys.push_back(key);
    }
    else {
      std::cout << "UNRECOGNIZED CMD!\n";
      return -1;
    }
    count++;
  }


  //==============================================================================
  typedef stx::btree_multimap<uint64_t, uint64_t> BtreeType;
  BtreeType stxbtree;
  BtreeType::iterator stxbtree_keyIter;
  std::pair<BtreeType::iterator, BtreeType::iterator> iter_pair;

  //WRITE ONLY TEST-----------------
  count = 0;
  timespec start_time;
  timespec end_time;
  while (count < (int)init_keys.size()) {
    for (int i = 0; i < VALUES_PER_KEY; i++) {
      clock_gettime(CLOCK_REALTIME, &start_time);
      //**********************************************************************************************
      stxbtree.insert(init_keys[count], values[value_count]);
      //**********************************************************************************************
      value_count++;
      clock_gettime(CLOCK_REALTIME, &end_time);
      outfile_latency_insert << ((end_time.tv_sec - start_time.tv_sec) * 1000000000 + (end_time.tv_nsec - start_time.tv_nsec)) << "\n";
    }
    count++;
  }

  //READ/UPDATE TEST----------------
  int txn_num = 0;
  uint64_t sum = 0;
  while ((txn_num < LIMIT) && (txn_num < (int)ops.size())) {
    clock_gettime(CLOCK_REALTIME, &start_time);
    if (ops[txn_num] == 1) { //READ
    //************************************************
      iter_pair = stxbtree.equal_range(keys[txn_num]);
    //************************************************
      if (iter_pair.first == iter_pair.second) {
	std::cout << "READ FAIL\n";
	return -1;
      }
      while (iter_pair.first != iter_pair.second) {
	sum += iter_pair.first->second;
	iter_pair.first++;
      }
    }
    else if (ops[txn_num] == 2) { //UPDATE
    //**********************************
      stxbtree_keyIter = stxbtree.find(keys[txn_num]);
      stxbtree_keyIter.data() = values[txn_num];
    //**********************************
    }
    else {
      std::cout << "UNRECOGNIZED CMD!\n";
      return -1;
    }
    txn_num++;
    clock_gettime(CLOCK_REALTIME, &end_time);
    outfile_latency_read_update << ((end_time.tv_sec - start_time.tv_sec) * 1000000000 + (end_time.tv_nsec - start_time.tv_nsec)) << "\n";
  }

  return 0;
}
