#include "microbench.hh"
#include "stx-compress/btree_map.h"
#include "stx-compress/btree.h"

int main() {
  std::ifstream infile_load("workloads/loadc_zipf_int_100M.dat");
  std::ifstream infile_txn("workloads/txnsc_zipf_int_100M.dat");

  std::string op;
  std::string key;

  std::vector<GenericKey<21> > init_keys;
  std::vector<int> ops; //INSERT = 0, READ = 1
  std::vector<GenericKey<21> > keys;
  std::vector<uint64_t> values;

  std::string insert("INSERT");
  std::string read("READ");

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
    else {
      std::cout << "UNRECOGNIZED CMD!\n";
      return -1;
    }
    count++;
  }


  //==============================================================================
  typedef AllocatorTracker<std::pair<const GenericKey<21>, uint64_t> > AllocatorType;
  typedef stx::btree_map<GenericKey<21>, uint64_t, GenericComparator<21>, stx::btree_default_map_traits<GenericKey<21>, uint64_t>, AllocatorType> BtreeType;

  int64_t memory = 0;
  AllocatorType *alloc = new AllocatorType(&memory);
  BtreeType *stxbtree = new BtreeType(GenericComparator<21>(), (*alloc));
  BtreeType::hybrid_iterator stxbtree_keyIter;

  //INITIALIZE----------------------
  count = 0;
  while (count < (int)init_keys.size()) {
    //**********************************************************************************************
    std::pair<typename BtreeType::iterator, bool> retval = stxbtree->insert(init_keys[count], values[count]);
    //**********************************************************************************************
    if (retval.second == false) {
      std::cout << "LOAD FAIL!\n";
      return -1;
    }
    count++;
  }

  std::cout << "stxbtree compact random string " << "memory " << (memory + stxbtree->get_compressed_data_size() + stxbtree->get_bloom_filter_size() + stxbtree->get_leaf_buffer_size() + 0.0)/1000000 << "\n";

  //READ/UPDATE TEST----------------
  double start_time = get_now();
  int txn_num = 0;
  uint64_t sum = 0;
  while ((txn_num < LIMIT) && (txn_num < (int)ops.size())) {
    if (ops[txn_num] == 1) { //READ
    //********************************************************
      stxbtree_keyIter = stxbtree->find_hybrid(keys[txn_num]);
    //********************************************************
      if (stxbtree_keyIter.isEnd()) {
	std::cout << "READ FAIL\n";
	return -1;
      }
      sum += stxbtree_keyIter->second;
      //stxbtree_keyIter.clear();
    }
    else {
      std::cout << "UNRECOGNIZED CMD!\n";
      return -1;
    }
    txn_num++;
  }
  double end_time = get_now();
  double tput = txn_num / (end_time - start_time) / 1000000; //Mops/sec

  std::cout << "stxbtree compact random string " << "read " << (tput + (sum - sum)) << "\n";

  return 0;
}
