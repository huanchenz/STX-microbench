#include "microbench.hh"
#include "stx/btree_map.h"
#include "stx/btree.h"

int main() {
  std::ifstream infile_load("workloads/loade_zipf_int_100M.dat");
  std::ifstream infile_txn("workloads/txnse_zipf_int_100M.dat");
  std::ofstream outfile_latency_scan_insert("latencies/stxbtree_ori_random_str_scan_insert.csv");

  std::string op;
  std::string key;
  int range;

  std::vector<GenericKey<21> > init_keys;
  std::vector<int> ops; //INSERT = 0, SCAN = 3
  std::vector<GenericKey<21> > keys;
  std::vector<int> ranges;
  std::vector<uint64_t> values;

  std::string insert("INSERT");
  std::string scan("SCAN");

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
    if (op.compare(insert) == 0) {
      ops.push_back(0);
      key_gen.setFromString(key + "0");
      keys.push_back(key_gen);
      ranges.push_back(1);
    }
    else if (op.compare(scan) == 0) {
      infile_txn >> range;
      ops.push_back(3);
      key_gen.setFromString(key);
      keys.push_back(key_gen);
      ranges.push_back(range);
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
  BtreeType::const_iterator stxbtree_keyIter;

  //WRITE ONLY TEST-----------------
  count = 0;
  timespec start_time;
  timespec end_time;
  while (count < (int)init_keys.size()) {
    //**********************************************************************************************
    std::pair<typename BtreeType::iterator, bool> retval = stxbtree.insert(init_keys[count], values[count]);
    //**********************************************************************************************
    if (retval.second == false) {
      std::cout << "LOAD FAIL!\n";
      return -1;
    }
    count++;
  }

  //SCAN/INSERT TEST----------------
  int txn_num = 0;
  uint64_t sum = 0;
  while ((txn_num < LIMIT) && (txn_num < (int)ops.size())) {
    clock_gettime(CLOCK_REALTIME, &start_time);
    if (ops[txn_num] == 0) { //INSERT
    //*********************************************************************************************
      std::pair<typename BtreeType::iterator, bool> retval = stxbtree.insert(keys[txn_num], values[txn_num]);
    //*********************************************************************************************
      if (retval.second == false) {
	std::cout << "INSERT FAIL!\n";
	return -1;
      }
    }
    else if (ops[txn_num] == 3) { //SCAN
    //***************************************************************
      stxbtree_keyIter = stxbtree.lower_bound(keys[txn_num]);
    //***************************************************************
      if (stxbtree_keyIter == stxbtree.end()) {
	std::cout << "SCAN FIRST READ FAIL\n";
	return -1;
      }

      sum += stxbtree_keyIter->second;
      for (int i = 0; i < ranges[txn_num]; i++) {
	//******************
	++stxbtree_keyIter;
	//******************
	if (stxbtree_keyIter == stxbtree.end()) {
	  break;
	}
	sum += stxbtree_keyIter->second;
      }
    }
    else {
      std::cout << "UNRECOGNIZED CMD!\n";
      return -1;
    }
    txn_num++;
    clock_gettime(CLOCK_REALTIME, &end_time);
    outfile_latency_scan_insert << ((end_time.tv_sec - start_time.tv_sec) * 1000000000 + (end_time.tv_nsec - start_time.tv_nsec)) << "\n";
  }

  std::cout << sum << "\n";

  return 0;
}
