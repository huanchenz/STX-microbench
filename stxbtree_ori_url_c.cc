#include "microbench.hh"
#include "stx/btree_map.h"
#include "stx/btree.h"

int main() {
  std::ifstream infile_load("workloads/loadc_zipf_url_100M.dat");
  std::ifstream infile_txn("workloads/txnsc_zipf_url_100M.dat");

  std::string op;
  std::string key;

  std::vector<std::string> init_keys;
  std::vector<int> ops; //INSERT = 0, READ = 1
  std::vector<std::string> keys;

  std::string insert("INSERT");
  std::string read("READ");

  int count = 0;
  uint64_t value = 0;

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
    else {
      std::cout << "UNRECOGNIZED CMD!\n";
      return -1;
    }
    count++;
  }


  //==============================================================================
  typedef AllocatorTracker<std::pair<const std::string, uint64_t> > AllocatorType;
  typedef stx::btree_map<std::string, uint64_t, std::less<std::string>, stx::btree_default_map_traits<std::string, uint64_t>, AllocatorType> BtreeType;

  int64_t memory = 0;
  AllocatorType *alloc = new AllocatorType(&memory);
  BtreeType *stxbtree = new BtreeType(std::less<std::string>(), (*alloc));
  BtreeType::const_iterator stxbtree_keyIter;

  //INITIALIZE----------------------
  count = 0;
  while (count < (int)init_keys.size()) {
    //**********************************************************************************************
    std::pair<typename BtreeType::iterator, bool> retval = stxbtree->insert(init_keys[count], value);
    //**********************************************************************************************
    if (retval.second == false) {
      std::cout << "LOAD FAIL!\n";
      return -1;
    }
    count++;
    value++;
  }

  std::cout << "stxbtree original url " << "memory " << (memory + 0.0)/1000000 << "\n"; //compact

  //READ/UPDATE TEST----------------
  double start_time = get_now();
  int txn_num = 0;
  value = 0;
  uint64_t sum = 0;
  while ((txn_num < LIMIT) && (txn_num < (int)ops.size())) {
    if (ops[txn_num] == 1) { //READ
    //************************************************
      stxbtree_keyIter = stxbtree->find(keys[txn_num]);
    //************************************************
      if (stxbtree_keyIter == stxbtree->end()) {
	std::cout << "READ FAIL\n";
	return -1;
      }
      sum += stxbtree_keyIter->second;
    }
    else {
      std::cout << "UNRECOGNIZED CMD!\n";
      return -1;
    }
    txn_num++;
  }
  double end_time = get_now();
  double tput = txn_num / (end_time - start_time) / 1000000; //Mops/sec

  std::cout << "stxbtree original url " << "read " << (tput + (sum - sum)) << "\n";

  return 0;
}
