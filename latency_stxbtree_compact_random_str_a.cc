#include "microbench.hh"
#include "stx-compact/btree_map.h"
#include "stx-compact/btree.h"

int main() {
  std::ifstream infile_load("workloads/loada_zipf_int_100M.dat");
  std::ifstream infile_txn("workloads/txnsa_zipf_int_100M.dat");
  std::ofstream outfile_latency_insert("latencies/stxbtree_compact_random_str_insert.csv");
  std::ofstream outfile_latency_read_update("latencies/stxbtree_compact_random_str_read_update.csv");

  std::string op;
  std::string key;

  std::vector<GenericKey<21> > init_keys;
  std::vector<int> ops; //INSERT = 0, READ = 1, UPDATE = 2
  std::vector<GenericKey<21> > keys;
  std::vector<uint64_t> values;

  std::string insert("INSERT");
  std::string read("READ");
  std::string update("UPDATE");

  int count = 0;
  uint64_t value = 0;
  GenericKey<21> key_gen;
  void *base_ptr = malloc(8);
  uint64_t base = (uint64_t)(base_ptr);
  free(base_ptr);

  while (count < INIT_LIMIT) {
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
    else if (op.compare(update) == 0) {
      ops.push_back(2);
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
  typedef stx::btree_map<GenericKey<21>, uint64_t, GenericComparator<21> > BtreeType;
  BtreeType stxbtree;
  BtreeType::hybrid_iterator stxbtree_keyIter;

  //WRITE ONLY TEST-----------------
  count = 0;
  timespec start_time;
  timespec end_time;
  while (count < (int)init_keys.size()) {
    clock_gettime(CLOCK_REALTIME, &start_time);
    //**********************************************************************************************
    std::pair<typename BtreeType::iterator, bool> retval = stxbtree.insert(init_keys[count], values[count]);
    //**********************************************************************************************
    clock_gettime(CLOCK_REALTIME, &end_time);
    if (retval.second == false) {
      std::cout << "LOAD FAIL!\n";
      return -1;
    }
    outfile_latency_insert << ((end_time.tv_sec - start_time.tv_sec) * 1000000000 + (end_time.tv_nsec - start_time.tv_nsec)) << "\n";
    count++;
  }

  //READ/UPDATE TEST----------------
  int txn_num = 0;
  uint64_t sum = 0;
  while ((txn_num < LIMIT) && (txn_num < (int)ops.size())) {
    clock_gettime(CLOCK_REALTIME, &start_time);
    if (ops[txn_num] == 1) { //READ
    //*******************************************************
      stxbtree_keyIter = stxbtree.find_hybrid(keys[txn_num]);
    //*******************************************************
      if (stxbtree_keyIter.isEnd()) {
	std::cout << "READ FAIL\n";
	return -1;
      }
      sum += stxbtree_keyIter->second;
    }
    else if (ops[txn_num] == 2) { //UPDATE
    //**********************************
      stxbtree[keys[txn_num]] = values[txn_num];
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
