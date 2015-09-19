#include <vector>
#include <fstream>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <string.h>
#include <utility>
#include <time.h>
#include <sys/time.h>

#include "allocatortracker.hh"

#include <map>
//#include "stx/btree_map.h"
//#include "stx/btree.h"
//#include "stx-compact/btree_map.h"
//#include "stx-compact/btree.h"
//#include "stx-compress/btree_map.h"
//#include "stx-compress/btree.h"

//#define INIT_LIMIT 1000000
//#define LIMIT 1000000
#define INIT_LIMIT 50000000
#define LIMIT 10000000

#define VALUES_PER_KEY 10

inline double get_now() {
  struct timeval tv;
  gettimeofday(&tv, 0);
  return tv.tv_sec + tv.tv_usec / 1000000.0;
}

template <std::size_t keySize>
class GenericKey {
public:
  inline void setFromString(std::string key) {
    memset(data, 0, keySize);
    strcpy(data, key.c_str());
  }

  char data[keySize];
};

template <std::size_t keySize>
class GenericComparator {
public:
  GenericComparator() {}

  inline bool operator()(const GenericKey<keySize> &lhs, const GenericKey<keySize> &rhs) const {
    int diff = strcmp(lhs.data, rhs.data);
    return diff < 0;
  }
};
