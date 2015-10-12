#include "microbench.hh"
#include "stx-compact/btree_map.h"
#include "stx-compact/btree.h"

int main() {
  std::ifstream infile_load("workloads/loadc_zipf_int_100M.dat");
  std::ofstream outfile_merge_time("merge_time/stxbtree_compact.csv");

  std::string op;
  uint64_t key;

  std::vector<uint64_t> init_keys;
  std::vector<uint64_t> keys;
  std::vector<uint64_t> values;

  std::string insert("INSERT");

  int count = 0;
  uint64_t value = 0;
  void *base_ptr = malloc(8);
  uint64_t base = (uint64_t)(base_ptr);
  free(base_ptr);

  while (count < INIT_LIMIT) {
    value = base + rand();
    values.push_back(value);
    count++;
  }

  count = 0;
  while (count < INIT_LIMIT) {
    infile_load >> op >> key;
    if (op.compare(insert) != 0) {
      std::cout << "READING LOAD FILE FAIL!\n";
      return -1;
    }
    init_keys.push_back(key);
    count++;
  }

  //==============================================================================
  typedef AllocatorTracker<std::pair<const uint64_t, uint64_t> > AllocatorType;
  typedef stx::btree_map<uint64_t, uint64_t, std::less<uint64_t>, stx::btree_default_map_traits<uint64_t, uint64_t>, AllocatorType> BtreeType;

  int64_t memory = 0;
  AllocatorType *alloc = new AllocatorType(&memory);
  BtreeType *stxbtree = new BtreeType(std::less<uint64_t>(), (*alloc));
  BtreeType::hybrid_iterator stxbtree_keyIter;

  //INITIALIZE----------------------
  count = 0;
  timespec start_time;
  timespec end_time;
  while (count < (int)init_keys.size()) {
    clock_gettime(CLOCK_REALTIME, &start_time);
    //**********************************************************************************************
    std::pair<typename BtreeType::iterator, bool> retval = stxbtree->insert(init_keys[count], values[count]);
    //**********************************************************************************************
    clock_gettime(CLOCK_REALTIME, &end_time);
    if (retval.second == false) {
      std::cout << "LOAD FAIL!\n";
      return -1;
    }

    long time_elapsed = (end_time.tv_sec - start_time.tv_sec) * 1000000000 + (end_time.tv_nsec - start_time.tv_nsec);

    if (time_elapsed > 1000000) {
      outfile_merge_time << (memory + 0.0)/1000000 << " " << (time_elapsed/1000) << "\n"; //us
    }

    count++;
  }

  return 0;
}
