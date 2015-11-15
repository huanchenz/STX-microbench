CC = gcc
CXX = g++ -std=gnu++0x
CFLAGS = -g -O2 -fPIC
DEPSDIR := hybrid_index/.deps
DEPCFLAGS = -MD -MF $(DEPSDIR)/$*.d -MP
MEMMGR = -ltcmalloc_minimal

SNAPPY = /usr/lib/libsnappy.so.1.3.0

#all: stxbtree_ori_random_int_a stxbtree_ori_random_int_c stxbtree_ori_random_int_e stxbtree_ori_monoinc_int_a stxbtree_ori_monoinc_int_c stxbtree_ori_monoinc_int_e stxbtree_ori_random_str_a stxbtree_ori_random_str_c stxbtree_ori_random_str_e stxbtree_ori_email_a stxbtree_ori_email_c stxbtree_ori_email_e stxbtree_ori_url_a stxbtree_ori_url_c stxbtree_ori_url_e 
#all: stxbtree_compact_random_int_a stxbtree_compact_random_int_c stxbtree_compact_random_int_e stxbtree_compact_monoinc_int_a stxbtree_compact_monoinc_int_c stxbtree_compact_monoinc_int_e stxbtree_compact_random_str_a stxbtree_compact_random_str_c stxbtree_compact_random_str_e stxbtree_compact_email_a stxbtree_compact_email_c stxbtree_compact_email_e stxbtree_compact_url_a stxbtree_compact_url_c stxbtree_compact_url_e 
#all: stxbtree_compress_random_int_a stxbtree_compress_random_int_c stxbtree_compress_random_int_e stxbtree_compress_monoinc_int_a stxbtree_compress_monoinc_int_c stxbtree_compress_monoinc_int_e stxbtree_compress_random_str_a stxbtree_compress_random_str_c stxbtree_compress_random_str_e stxbtree_compress_email_a stxbtree_compress_email_c stxbtree_compress_email_e stxbtree_compress_url_a stxbtree_compress_url_c stxbtree_compress_url_e
#all: stxbtree_ori_random_int_c stxbtree_ori_monoinc_int_c stxbtree_ori_email_c stxbtree_compact_random_int_c stxbtree_compact_monoinc_int_c stxbtree_compact_email_c stxbtree_compress_random_int_c stxbtree_compress_monoinc_int_c stxbtree_compress_email_c 

#all: stxbtree_multi_ori_random_int_a stxbtree_multi_ori_random_int_c stxbtree_multi_ori_random_int_e stxbtree_multi_ori_monoinc_int_a stxbtree_multi_ori_monoinc_int_c stxbtree_multi_ori_monoinc_int_e stxbtree_multi_ori_random_str_a stxbtree_multi_ori_random_str_c stxbtree_multi_ori_random_str_e stxbtree_multi_ori_email_a stxbtree_multi_ori_email_c stxbtree_multi_ori_email_e
#all: stxbtree_multi_compact_random_int_a stxbtree_multi_compact_random_int_c stxbtree_multi_compact_random_int_e stxbtree_multi_compact_monoinc_int_a stxbtree_multi_compact_monoinc_int_c stxbtree_multi_compact_monoinc_int_e stxbtree_multi_compact_random_str_a stxbtree_multi_compact_random_str_c stxbtree_multi_compact_random_str_e stxbtree_multi_compact_email_a stxbtree_multi_compact_email_c stxbtree_multi_compact_email_e
#all: stxbtree_multi_compress_random_int_a stxbtree_multi_compress_random_int_c stxbtree_multi_compress_random_int_e stxbtree_multi_compress_monoinc_int_a stxbtree_multi_compress_monoinc_int_c stxbtree_multi_compress_monoinc_int_e stxbtree_multi_compress_random_str_a stxbtree_multi_compress_random_str_c stxbtree_multi_compress_random_str_e stxbtree_multi_compress_email_a stxbtree_multi_compress_email_c stxbtree_multi_compress_email_e

#all: latency_stxbtree_ori_random_int_a latency_stxbtree_ori_random_int_c latency_stxbtree_ori_random_int_e latency_stxbtree_ori_monoinc_int_a latency_stxbtree_ori_monoinc_int_c latency_stxbtree_ori_monoinc_int_e latency_stxbtree_ori_random_str_a latency_stxbtree_ori_random_str_c latency_stxbtree_ori_random_str_e latency_stxbtree_ori_email_a latency_stxbtree_ori_email_c latency_stxbtree_ori_email_e 
#all: latency_stxbtree_compact_random_int_a latency_stxbtree_compact_random_int_c latency_stxbtree_compact_random_int_e latency_stxbtree_compact_monoinc_int_a latency_stxbtree_compact_monoinc_int_c latency_stxbtree_compact_monoinc_int_e latency_stxbtree_compact_random_str_a latency_stxbtree_compact_random_str_c latency_stxbtree_compact_random_str_e latency_stxbtree_compact_email_a latency_stxbtree_compact_email_c latency_stxbtree_compact_email_e 
#all: latency_stxbtree_compress_random_int_a latency_stxbtree_compress_random_int_c latency_stxbtree_compress_random_int_e latency_stxbtree_compress_monoinc_int_a latency_stxbtree_compress_monoinc_int_c latency_stxbtree_compress_monoinc_int_e latency_stxbtree_compress_random_str_a latency_stxbtree_compress_random_str_c latency_stxbtree_compress_random_str_e latency_stxbtree_compress_email_a latency_stxbtree_compress_email_c latency_stxbtree_compress_email_e

#all: latency_stxbtree_multi_ori_random_int_a latency_stxbtree_multi_ori_random_int_c latency_stxbtree_multi_ori_random_int_e latency_stxbtree_multi_ori_monoinc_int_a latency_stxbtree_multi_ori_monoinc_int_c latency_stxbtree_multi_ori_monoinc_int_e latency_stxbtree_multi_ori_random_str_a latency_stxbtree_multi_ori_random_str_c latency_stxbtree_multi_ori_random_str_e latency_stxbtree_multi_ori_email_a latency_stxbtree_multi_ori_email_c latency_stxbtree_multi_ori_email_e 
#all: latency_stxbtree_multi_compact_random_int_a latency_stxbtree_multi_compact_random_int_c latency_stxbtree_multi_compact_random_int_e latency_stxbtree_multi_compact_monoinc_int_a latency_stxbtree_multi_compact_monoinc_int_c latency_stxbtree_multi_compact_monoinc_int_e latency_stxbtree_multi_compact_random_str_a latency_stxbtree_multi_compact_random_str_c latency_stxbtree_multi_compact_random_str_e latency_stxbtree_multi_compact_email_a latency_stxbtree_multi_compact_email_c latency_stxbtree_multi_compact_email_e 
#all: latency_stxbtree_multi_compress_random_int_a latency_stxbtree_multi_compress_random_int_c latency_stxbtree_multi_compress_random_int_e latency_stxbtree_multi_compress_monoinc_int_a latency_stxbtree_multi_compress_monoinc_int_c latency_stxbtree_multi_compress_monoinc_int_e latency_stxbtree_multi_compress_random_str_a latency_stxbtree_multi_compress_random_str_c latency_stxbtree_multi_compress_random_str_e latency_stxbtree_multi_compress_email_a latency_stxbtree_multi_compress_email_c latency_stxbtree_multi_compress_email_e

#all: merge_time_stxbtree_compact merge_time_stxbtree_compress 
all: merge_ratio_stxbtree_compact 
#all: merge_ratio_stxbtree_compress


#stxbtree original random int=====================================================================
stxbtree_ori_random_int_a.o: stxbtree_ori_random_int_a.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_ori_random_int_a.o stxbtree_ori_random_int_a.cc

stxbtree_ori_random_int_a: stxbtree_ori_random_int_a.o
	$(CXX) $(CFLAGS) -o stxbtree_ori_random_int_a stxbtree_ori_random_int_a.o $(MEMMGR) -lpthread -lm

latency_stxbtree_ori_random_int_a.o: latency_stxbtree_ori_random_int_a.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_ori_random_int_a.o latency_stxbtree_ori_random_int_a.cc

latency_stxbtree_ori_random_int_a: latency_stxbtree_ori_random_int_a.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_ori_random_int_a latency_stxbtree_ori_random_int_a.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_ori_random_int_c.o: stxbtree_ori_random_int_c.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_ori_random_int_c.o stxbtree_ori_random_int_c.cc

stxbtree_ori_random_int_c: stxbtree_ori_random_int_c.o
	$(CXX) $(CFLAGS) -o stxbtree_ori_random_int_c stxbtree_ori_random_int_c.o $(MEMMGR) -lpthread -lm

latency_stxbtree_ori_random_int_c.o: latency_stxbtree_ori_random_int_c.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_ori_random_int_c.o latency_stxbtree_ori_random_int_c.cc

latency_stxbtree_ori_random_int_c: latency_stxbtree_ori_random_int_c.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_ori_random_int_c latency_stxbtree_ori_random_int_c.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_ori_random_int_e.o: stxbtree_ori_random_int_e.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_ori_random_int_e.o stxbtree_ori_random_int_e.cc

stxbtree_ori_random_int_e: stxbtree_ori_random_int_e.o
	$(CXX) $(CFLAGS) -o stxbtree_ori_random_int_e stxbtree_ori_random_int_e.o $(MEMMGR) -lpthread -lm

latency_stxbtree_ori_random_int_e.o: latency_stxbtree_ori_random_int_e.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_ori_random_int_e.o latency_stxbtree_ori_random_int_e.cc

latency_stxbtree_ori_random_int_e: latency_stxbtree_ori_random_int_e.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_ori_random_int_e latency_stxbtree_ori_random_int_e.o $(MEMMGR) -lpthread -lm -lrt

#stxbtree original mono inc int=====================================================================
stxbtree_ori_monoinc_int_a.o: stxbtree_ori_monoinc_int_a.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_ori_monoinc_int_a.o stxbtree_ori_monoinc_int_a.cc

stxbtree_ori_monoinc_int_a: stxbtree_ori_monoinc_int_a.o
	$(CXX) $(CFLAGS) -o stxbtree_ori_monoinc_int_a stxbtree_ori_monoinc_int_a.o $(MEMMGR) -lpthread -lm

latency_stxbtree_ori_monoinc_int_a.o: latency_stxbtree_ori_monoinc_int_a.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_ori_monoinc_int_a.o latency_stxbtree_ori_monoinc_int_a.cc

latency_stxbtree_ori_monoinc_int_a: latency_stxbtree_ori_monoinc_int_a.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_ori_monoinc_int_a latency_stxbtree_ori_monoinc_int_a.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_ori_monoinc_int_c.o: stxbtree_ori_monoinc_int_c.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_ori_monoinc_int_c.o stxbtree_ori_monoinc_int_c.cc

stxbtree_ori_monoinc_int_c: stxbtree_ori_monoinc_int_c.o
	$(CXX) $(CFLAGS) -o stxbtree_ori_monoinc_int_c stxbtree_ori_monoinc_int_c.o $(MEMMGR) -lpthread -lm

latency_stxbtree_ori_monoinc_int_c.o: latency_stxbtree_ori_monoinc_int_c.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_ori_monoinc_int_c.o latency_stxbtree_ori_monoinc_int_c.cc

latency_stxbtree_ori_monoinc_int_c: latency_stxbtree_ori_monoinc_int_c.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_ori_monoinc_int_c latency_stxbtree_ori_monoinc_int_c.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_ori_monoinc_int_e.o: stxbtree_ori_monoinc_int_e.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_ori_monoinc_int_e.o stxbtree_ori_monoinc_int_e.cc

stxbtree_ori_monoinc_int_e: stxbtree_ori_monoinc_int_e.o
	$(CXX) $(CFLAGS) -o stxbtree_ori_monoinc_int_e stxbtree_ori_monoinc_int_e.o $(MEMMGR) -lpthread -lm

latency_stxbtree_ori_monoinc_int_e.o: latency_stxbtree_ori_monoinc_int_e.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_ori_monoinc_int_e.o latency_stxbtree_ori_monoinc_int_e.cc

latency_stxbtree_ori_monoinc_int_e: latency_stxbtree_ori_monoinc_int_e.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_ori_monoinc_int_e latency_stxbtree_ori_monoinc_int_e.o $(MEMMGR) -lpthread -lm -lrt

#stxbtree original random string=====================================================================
stxbtree_ori_random_str_a.o: stxbtree_ori_random_str_a.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_ori_random_str_a.o stxbtree_ori_random_str_a.cc

stxbtree_ori_random_str_a: stxbtree_ori_random_str_a.o
	$(CXX) $(CFLAGS) -o stxbtree_ori_random_str_a stxbtree_ori_random_str_a.o $(MEMMGR) -lpthread -lm

latency_stxbtree_ori_random_str_a.o: latency_stxbtree_ori_random_str_a.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_ori_random_str_a.o latency_stxbtree_ori_random_str_a.cc

latency_stxbtree_ori_random_str_a: latency_stxbtree_ori_random_str_a.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_ori_random_str_a latency_stxbtree_ori_random_str_a.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_ori_random_str_c.o: stxbtree_ori_random_str_c.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_ori_random_str_c.o stxbtree_ori_random_str_c.cc

stxbtree_ori_random_str_c: stxbtree_ori_random_str_c.o
	$(CXX) $(CFLAGS) -o stxbtree_ori_random_str_c stxbtree_ori_random_str_c.o $(MEMMGR) -lpthread -lm

latency_stxbtree_ori_random_str_c.o: latency_stxbtree_ori_random_str_c.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_ori_random_str_c.o latency_stxbtree_ori_random_str_c.cc

latency_stxbtree_ori_random_str_c: latency_stxbtree_ori_random_str_c.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_ori_random_str_c latency_stxbtree_ori_random_str_c.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_ori_random_str_e.o: stxbtree_ori_random_str_e.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_ori_random_str_e.o stxbtree_ori_random_str_e.cc

stxbtree_ori_random_str_e: stxbtree_ori_random_str_e.o
	$(CXX) $(CFLAGS) -o stxbtree_ori_random_str_e stxbtree_ori_random_str_e.o $(MEMMGR) -lpthread -lm

latency_stxbtree_ori_random_str_e.o: latency_stxbtree_ori_random_str_e.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_ori_random_str_e.o latency_stxbtree_ori_random_str_e.cc

latency_stxbtree_ori_random_str_e: latency_stxbtree_ori_random_str_e.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_ori_random_str_e latency_stxbtree_ori_random_str_e.o $(MEMMGR) -lpthread -lm -lrt

#stxbtree original email=============================================================================
stxbtree_ori_email_a.o: stxbtree_ori_email_a.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_ori_email_a.o stxbtree_ori_email_a.cc

stxbtree_ori_email_a: stxbtree_ori_email_a.o
	$(CXX) $(CFLAGS) -o stxbtree_ori_email_a stxbtree_ori_email_a.o $(MEMMGR) -lpthread -lm

latency_stxbtree_ori_email_a.o: latency_stxbtree_ori_email_a.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_ori_email_a.o latency_stxbtree_ori_email_a.cc

latency_stxbtree_ori_email_a: latency_stxbtree_ori_email_a.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_ori_email_a latency_stxbtree_ori_email_a.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_ori_email_c.o: stxbtree_ori_email_c.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_ori_email_c.o stxbtree_ori_email_c.cc

stxbtree_ori_email_c: stxbtree_ori_email_c.o
	$(CXX) $(CFLAGS) -o stxbtree_ori_email_c stxbtree_ori_email_c.o $(MEMMGR) -lpthread -lm

latency_stxbtree_ori_email_c.o: latency_stxbtree_ori_email_c.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_ori_email_c.o latency_stxbtree_ori_email_c.cc

latency_stxbtree_ori_email_c: latency_stxbtree_ori_email_c.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_ori_email_c latency_stxbtree_ori_email_c.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_ori_email_e.o: stxbtree_ori_email_e.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_ori_email_e.o stxbtree_ori_email_e.cc

stxbtree_ori_email_e: stxbtree_ori_email_e.o
	$(CXX) $(CFLAGS) -o stxbtree_ori_email_e stxbtree_ori_email_e.o $(MEMMGR) -lpthread -lm

latency_stxbtree_ori_email_e.o: latency_stxbtree_ori_email_e.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_ori_email_e.o latency_stxbtree_ori_email_e.cc

latency_stxbtree_ori_email_e: latency_stxbtree_ori_email_e.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_ori_email_e latency_stxbtree_ori_email_e.o $(MEMMGR) -lpthread -lm -lrt

#stxbtree original url=============================================================================
stxbtree_ori_url_a.o: stxbtree_ori_url_a.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_ori_url_a.o stxbtree_ori_url_a.cc

stxbtree_ori_url_a: stxbtree_ori_url_a.o
	$(CXX) $(CFLAGS) -o stxbtree_ori_url_a stxbtree_ori_url_a.o $(MEMMGR) -lpthread -lm

stxbtree_ori_url_c.o: stxbtree_ori_url_c.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_ori_url_c.o stxbtree_ori_url_c.cc

stxbtree_ori_url_c: stxbtree_ori_url_c.o
	$(CXX) $(CFLAGS) -o stxbtree_ori_url_c stxbtree_ori_url_c.o $(MEMMGR) -lpthread -lm

stxbtree_ori_url_e.o: stxbtree_ori_url_e.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_ori_url_e.o stxbtree_ori_url_e.cc

stxbtree_ori_url_e: stxbtree_ori_url_e.o
	$(CXX) $(CFLAGS) -o stxbtree_ori_url_e stxbtree_ori_url_e.o $(MEMMGR) -lpthread -lm


#stxbtree compact random int=====================================================================
stxbtree_compact_random_int_a.o: stxbtree_compact_random_int_a.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compact_random_int_a.o stxbtree_compact_random_int_a.cc

stxbtree_compact_random_int_a: stxbtree_compact_random_int_a.o
	$(CXX) $(CFLAGS) -o stxbtree_compact_random_int_a stxbtree_compact_random_int_a.o $(MEMMGR) -lpthread -lm

latency_stxbtree_compact_random_int_a.o: latency_stxbtree_compact_random_int_a.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_compact_random_int_a.o latency_stxbtree_compact_random_int_a.cc

latency_stxbtree_compact_random_int_a: latency_stxbtree_compact_random_int_a.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_compact_random_int_a latency_stxbtree_compact_random_int_a.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_compact_random_int_c.o: stxbtree_compact_random_int_c.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compact_random_int_c.o stxbtree_compact_random_int_c.cc

stxbtree_compact_random_int_c: stxbtree_compact_random_int_c.o
	$(CXX) $(CFLAGS) -o stxbtree_compact_random_int_c stxbtree_compact_random_int_c.o $(MEMMGR) -lpthread -lm

latency_stxbtree_compact_random_int_c.o: latency_stxbtree_compact_random_int_c.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_compact_random_int_c.o latency_stxbtree_compact_random_int_c.cc

latency_stxbtree_compact_random_int_c: latency_stxbtree_compact_random_int_c.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_compact_random_int_c latency_stxbtree_compact_random_int_c.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_compact_random_int_e.o: stxbtree_compact_random_int_e.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compact_random_int_e.o stxbtree_compact_random_int_e.cc

stxbtree_compact_random_int_e: stxbtree_compact_random_int_e.o
	$(CXX) $(CFLAGS) -o stxbtree_compact_random_int_e stxbtree_compact_random_int_e.o $(MEMMGR) -lpthread -lm

latency_stxbtree_compact_random_int_e.o: latency_stxbtree_compact_random_int_e.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_compact_random_int_e.o latency_stxbtree_compact_random_int_e.cc

latency_stxbtree_compact_random_int_e: latency_stxbtree_compact_random_int_e.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_compact_random_int_e latency_stxbtree_compact_random_int_e.o $(MEMMGR) -lpthread -lm -lrt

#stxbtree compact mono inc int=====================================================================
stxbtree_compact_monoinc_int_a.o: stxbtree_compact_monoinc_int_a.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compact_monoinc_int_a.o stxbtree_compact_monoinc_int_a.cc

stxbtree_compact_monoinc_int_a: stxbtree_compact_monoinc_int_a.o
	$(CXX) $(CFLAGS) -o stxbtree_compact_monoinc_int_a stxbtree_compact_monoinc_int_a.o $(MEMMGR) -lpthread -lm

latency_stxbtree_compact_monoinc_int_a.o: latency_stxbtree_compact_monoinc_int_a.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_compact_monoinc_int_a.o latency_stxbtree_compact_monoinc_int_a.cc

latency_stxbtree_compact_monoinc_int_a: latency_stxbtree_compact_monoinc_int_a.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_compact_monoinc_int_a latency_stxbtree_compact_monoinc_int_a.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_compact_monoinc_int_c.o: stxbtree_compact_monoinc_int_c.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compact_monoinc_int_c.o stxbtree_compact_monoinc_int_c.cc

stxbtree_compact_monoinc_int_c: stxbtree_compact_monoinc_int_c.o
	$(CXX) $(CFLAGS) -o stxbtree_compact_monoinc_int_c stxbtree_compact_monoinc_int_c.o $(MEMMGR) -lpthread -lm

latency_stxbtree_compact_monoinc_int_c.o: latency_stxbtree_compact_monoinc_int_c.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_compact_monoinc_int_c.o latency_stxbtree_compact_monoinc_int_c.cc

latency_stxbtree_compact_monoinc_int_c: latency_stxbtree_compact_monoinc_int_c.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_compact_monoinc_int_c latency_stxbtree_compact_monoinc_int_c.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_compact_monoinc_int_e.o: stxbtree_compact_monoinc_int_e.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compact_monoinc_int_e.o stxbtree_compact_monoinc_int_e.cc

stxbtree_compact_monoinc_int_e: stxbtree_compact_monoinc_int_e.o
	$(CXX) $(CFLAGS) -o stxbtree_compact_monoinc_int_e stxbtree_compact_monoinc_int_e.o $(MEMMGR) -lpthread -lm

latency_stxbtree_compact_monoinc_int_e.o: latency_stxbtree_compact_monoinc_int_e.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_compact_monoinc_int_e.o latency_stxbtree_compact_monoinc_int_e.cc

latency_stxbtree_compact_monoinc_int_e: latency_stxbtree_compact_monoinc_int_e.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_compact_monoinc_int_e latency_stxbtree_compact_monoinc_int_e.o $(MEMMGR) -lpthread -lm -lrt

#stxbtree compact random str=====================================================================
stxbtree_compact_random_str_a.o: stxbtree_compact_random_str_a.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compact_random_str_a.o stxbtree_compact_random_str_a.cc

stxbtree_compact_random_str_a: stxbtree_compact_random_str_a.o
	$(CXX) $(CFLAGS) -o stxbtree_compact_random_str_a stxbtree_compact_random_str_a.o $(MEMMGR) -lpthread -lm

latency_stxbtree_compact_random_str_a.o: latency_stxbtree_compact_random_str_a.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_compact_random_str_a.o latency_stxbtree_compact_random_str_a.cc

latency_stxbtree_compact_random_str_a: latency_stxbtree_compact_random_str_a.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_compact_random_str_a latency_stxbtree_compact_random_str_a.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_compact_random_str_c.o: stxbtree_compact_random_str_c.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compact_random_str_c.o stxbtree_compact_random_str_c.cc

stxbtree_compact_random_str_c: stxbtree_compact_random_str_c.o
	$(CXX) $(CFLAGS) -o stxbtree_compact_random_str_c stxbtree_compact_random_str_c.o $(MEMMGR) -lpthread -lm

latency_stxbtree_compact_random_str_c.o: latency_stxbtree_compact_random_str_c.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_compact_random_str_c.o latency_stxbtree_compact_random_str_c.cc

latency_stxbtree_compact_random_str_c: latency_stxbtree_compact_random_str_c.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_compact_random_str_c latency_stxbtree_compact_random_str_c.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_compact_random_str_e.o: stxbtree_compact_random_str_e.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compact_random_str_e.o stxbtree_compact_random_str_e.cc

stxbtree_compact_random_str_e: stxbtree_compact_random_str_e.o
	$(CXX) $(CFLAGS) -o stxbtree_compact_random_str_e stxbtree_compact_random_str_e.o $(MEMMGR) -lpthread -lm

latency_stxbtree_compact_random_str_e.o: latency_stxbtree_compact_random_str_e.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_compact_random_str_e.o latency_stxbtree_compact_random_str_e.cc

latency_stxbtree_compact_random_str_e: latency_stxbtree_compact_random_str_e.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_compact_random_str_e latency_stxbtree_compact_random_str_e.o $(MEMMGR) -lpthread -lm -lrt

#stxbtree compact email=====================================================================
stxbtree_compact_email_a.o: stxbtree_compact_email_a.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compact_email_a.o stxbtree_compact_email_a.cc

stxbtree_compact_email_a: stxbtree_compact_email_a.o
	$(CXX) $(CFLAGS) -o stxbtree_compact_email_a stxbtree_compact_email_a.o $(MEMMGR) -lpthread -lm

latency_stxbtree_compact_email_a.o: latency_stxbtree_compact_email_a.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_compact_email_a.o latency_stxbtree_compact_email_a.cc

latency_stxbtree_compact_email_a: latency_stxbtree_compact_email_a.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_compact_email_a latency_stxbtree_compact_email_a.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_compact_email_c.o: stxbtree_compact_email_c.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compact_email_c.o stxbtree_compact_email_c.cc

stxbtree_compact_email_c: stxbtree_compact_email_c.o
	$(CXX) $(CFLAGS) -o stxbtree_compact_email_c stxbtree_compact_email_c.o $(MEMMGR) -lpthread -lm

latency_stxbtree_compact_email_c.o: latency_stxbtree_compact_email_c.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_compact_email_c.o latency_stxbtree_compact_email_c.cc

latency_stxbtree_compact_email_c: latency_stxbtree_compact_email_c.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_compact_email_c latency_stxbtree_compact_email_c.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_compact_email_e.o: stxbtree_compact_email_e.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compact_email_e.o stxbtree_compact_email_e.cc

stxbtree_compact_email_e: stxbtree_compact_email_e.o
	$(CXX) $(CFLAGS) -o stxbtree_compact_email_e stxbtree_compact_email_e.o $(MEMMGR) -lpthread -lm

latency_stxbtree_compact_email_e.o: latency_stxbtree_compact_email_e.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_compact_email_e.o latency_stxbtree_compact_email_e.cc

latency_stxbtree_compact_email_e: latency_stxbtree_compact_email_e.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_compact_email_e latency_stxbtree_compact_email_e.o $(MEMMGR) -lpthread -lm -lrt

#stxbtree compact url=====================================================================
stxbtree_compact_url_a.o: stxbtree_compact_url_a.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compact_url_a.o stxbtree_compact_url_a.cc

stxbtree_compact_url_a: stxbtree_compact_url_a.o
	$(CXX) $(CFLAGS) -o stxbtree_compact_url_a stxbtree_compact_url_a.o $(MEMMGR) -lpthread -lm

stxbtree_compact_url_c.o: stxbtree_compact_url_c.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compact_url_c.o stxbtree_compact_url_c.cc

stxbtree_compact_url_c: stxbtree_compact_url_c.o
	$(CXX) $(CFLAGS) -o stxbtree_compact_url_c stxbtree_compact_url_c.o $(MEMMGR) -lpthread -lm

stxbtree_compact_url_e.o: stxbtree_compact_url_e.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compact_url_e.o stxbtree_compact_url_e.cc

stxbtree_compact_url_e: stxbtree_compact_url_e.o
	$(CXX) $(CFLAGS) -o stxbtree_compact_url_e stxbtree_compact_url_e.o $(MEMMGR) -lpthread -lm


#stxbtree compress random int=====================================================================
stxbtree_compress_random_int_a.o: stxbtree_compress_random_int_a.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compress_random_int_a.o stxbtree_compress_random_int_a.cc

stxbtree_compress_random_int_a: stxbtree_compress_random_int_a.o
	$(CXX) $(CFLAGS) -o stxbtree_compress_random_int_a stxbtree_compress_random_int_a.o $(SNAPPY) $(MEMMGR) -lpthread -lm

latency_stxbtree_compress_random_int_a.o: latency_stxbtree_compress_random_int_a.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_compress_random_int_a.o latency_stxbtree_compress_random_int_a.cc

latency_stxbtree_compress_random_int_a: latency_stxbtree_compress_random_int_a.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_compress_random_int_a latency_stxbtree_compress_random_int_a.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt

stxbtree_compress_random_int_c.o: stxbtree_compress_random_int_c.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compress_random_int_c.o stxbtree_compress_random_int_c.cc

stxbtree_compress_random_int_c: stxbtree_compress_random_int_c.o
	$(CXX) $(CFLAGS) -o stxbtree_compress_random_int_c stxbtree_compress_random_int_c.o $(SNAPPY) $(MEMMGR) -lpthread -lm

latency_stxbtree_compress_random_int_c.o: latency_stxbtree_compress_random_int_c.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_compress_random_int_c.o latency_stxbtree_compress_random_int_c.cc

latency_stxbtree_compress_random_int_c: latency_stxbtree_compress_random_int_c.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_compress_random_int_c latency_stxbtree_compress_random_int_c.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt

stxbtree_compress_random_int_e.o: stxbtree_compress_random_int_e.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compress_random_int_e.o stxbtree_compress_random_int_e.cc

stxbtree_compress_random_int_e: stxbtree_compress_random_int_e.o
	$(CXX) $(CFLAGS) -o stxbtree_compress_random_int_e stxbtree_compress_random_int_e.o $(SNAPPY) $(MEMMGR) -lpthread -lm

latency_stxbtree_compress_random_int_e.o: latency_stxbtree_compress_random_int_e.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_compress_random_int_e.o latency_stxbtree_compress_random_int_e.cc

latency_stxbtree_compress_random_int_e: latency_stxbtree_compress_random_int_e.o 
	$(CXX) $(CFLAGS) -o latency_stxbtree_compress_random_int_e latency_stxbtree_compress_random_int_e.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt

#stxbtree compress monoinc int=====================================================================
stxbtree_compress_monoinc_int_a.o: stxbtree_compress_monoinc_int_a.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compress_monoinc_int_a.o stxbtree_compress_monoinc_int_a.cc

stxbtree_compress_monoinc_int_a: stxbtree_compress_monoinc_int_a.o
	$(CXX) $(CFLAGS) -o stxbtree_compress_monoinc_int_a stxbtree_compress_monoinc_int_a.o $(SNAPPY) $(MEMMGR) -lpthread -lm

latency_stxbtree_compress_monoinc_int_a.o: latency_stxbtree_compress_monoinc_int_a.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_compress_monoinc_int_a.o latency_stxbtree_compress_monoinc_int_a.cc

latency_stxbtree_compress_monoinc_int_a: latency_stxbtree_compress_monoinc_int_a.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_compress_monoinc_int_a latency_stxbtree_compress_monoinc_int_a.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt

stxbtree_compress_monoinc_int_c.o: stxbtree_compress_monoinc_int_c.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compress_monoinc_int_c.o stxbtree_compress_monoinc_int_c.cc

stxbtree_compress_monoinc_int_c: stxbtree_compress_monoinc_int_c.o
	$(CXX) $(CFLAGS) -o stxbtree_compress_monoinc_int_c stxbtree_compress_monoinc_int_c.o $(SNAPPY) $(MEMMGR) -lpthread -lm

latency_stxbtree_compress_monoinc_int_c.o: latency_stxbtree_compress_monoinc_int_c.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_compress_monoinc_int_c.o latency_stxbtree_compress_monoinc_int_c.cc

latency_stxbtree_compress_monoinc_int_c: latency_stxbtree_compress_monoinc_int_c.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_compress_monoinc_int_c latency_stxbtree_compress_monoinc_int_c.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt

stxbtree_compress_monoinc_int_e.o: stxbtree_compress_monoinc_int_e.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compress_monoinc_int_e.o stxbtree_compress_monoinc_int_e.cc

stxbtree_compress_monoinc_int_e: stxbtree_compress_monoinc_int_e.o
	$(CXX) $(CFLAGS) -o stxbtree_compress_monoinc_int_e stxbtree_compress_monoinc_int_e.o $(SNAPPY) $(MEMMGR) -lpthread -lm

latency_stxbtree_compress_monoinc_int_e.o: latency_stxbtree_compress_monoinc_int_e.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_compress_monoinc_int_e.o latency_stxbtree_compress_monoinc_int_e.cc

latency_stxbtree_compress_monoinc_int_e: latency_stxbtree_compress_monoinc_int_e.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_compress_monoinc_int_e latency_stxbtree_compress_monoinc_int_e.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt

#stxbtree compress random str=====================================================================
stxbtree_compress_random_str_a.o: stxbtree_compress_random_str_a.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compress_random_str_a.o stxbtree_compress_random_str_a.cc

stxbtree_compress_random_str_a: stxbtree_compress_random_str_a.o
	$(CXX) $(CFLAGS) -o stxbtree_compress_random_str_a stxbtree_compress_random_str_a.o $(SNAPPY) $(MEMMGR) -lpthread -lm

latency_stxbtree_compress_random_str_a.o: latency_stxbtree_compress_random_str_a.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_compress_random_str_a.o latency_stxbtree_compress_random_str_a.cc

latency_stxbtree_compress_random_str_a: latency_stxbtree_compress_random_str_a.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_compress_random_str_a latency_stxbtree_compress_random_str_a.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt

stxbtree_compress_random_str_c.o: stxbtree_compress_random_str_c.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compress_random_str_c.o stxbtree_compress_random_str_c.cc

stxbtree_compress_random_str_c: stxbtree_compress_random_str_c.o
	$(CXX) $(CFLAGS) -o stxbtree_compress_random_str_c stxbtree_compress_random_str_c.o $(SNAPPY) $(MEMMGR) -lpthread -lm

latency_stxbtree_compress_random_str_c.o: latency_stxbtree_compress_random_str_c.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_compress_random_str_c.o latency_stxbtree_compress_random_str_c.cc

latency_stxbtree_compress_random_str_c: latency_stxbtree_compress_random_str_c.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_compress_random_str_c latency_stxbtree_compress_random_str_c.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt

stxbtree_compress_random_str_e.o: stxbtree_compress_random_str_e.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compress_random_str_e.o stxbtree_compress_random_str_e.cc

stxbtree_compress_random_str_e: stxbtree_compress_random_str_e.o
	$(CXX) $(CFLAGS) -o stxbtree_compress_random_str_e stxbtree_compress_random_str_e.o $(SNAPPY) $(MEMMGR) -lpthread -lm

latency_stxbtree_compress_random_str_e.o: latency_stxbtree_compress_random_str_e.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_compress_random_str_e.o latency_stxbtree_compress_random_str_e.cc

latency_stxbtree_compress_random_str_e: latency_stxbtree_compress_random_str_e.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_compress_random_str_e latency_stxbtree_compress_random_str_e.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt

#stxbtree compress email=====================================================================
stxbtree_compress_email_a.o: stxbtree_compress_email_a.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compress_email_a.o stxbtree_compress_email_a.cc

stxbtree_compress_email_a: stxbtree_compress_email_a.o
	$(CXX) $(CFLAGS) -o stxbtree_compress_email_a stxbtree_compress_email_a.o $(SNAPPY) $(MEMMGR) -lpthread -lm

latency_stxbtree_compress_email_a.o: latency_stxbtree_compress_email_a.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_compress_email_a.o latency_stxbtree_compress_email_a.cc

latency_stxbtree_compress_email_a: latency_stxbtree_compress_email_a.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_compress_email_a latency_stxbtree_compress_email_a.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt

stxbtree_compress_email_c.o: stxbtree_compress_email_c.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compress_email_c.o stxbtree_compress_email_c.cc

stxbtree_compress_email_c: stxbtree_compress_email_c.o
	$(CXX) $(CFLAGS) -o stxbtree_compress_email_c stxbtree_compress_email_c.o $(SNAPPY) $(MEMMGR) -lpthread -lm

latency_stxbtree_compress_email_c.o: latency_stxbtree_compress_email_c.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_compress_email_c.o latency_stxbtree_compress_email_c.cc

latency_stxbtree_compress_email_c: latency_stxbtree_compress_email_c.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_compress_email_c latency_stxbtree_compress_email_c.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt

stxbtree_compress_email_e.o: stxbtree_compress_email_e.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compress_email_e.o stxbtree_compress_email_e.cc

stxbtree_compress_email_e: stxbtree_compress_email_e.o
	$(CXX) $(CFLAGS) -o stxbtree_compress_email_e stxbtree_compress_email_e.o $(SNAPPY) $(MEMMGR) -lpthread -lm

latency_stxbtree_compress_email_e.o: latency_stxbtree_compress_email_e.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_compress_email_e.o latency_stxbtree_compress_email_e.cc

latency_stxbtree_compress_email_e: latency_stxbtree_compress_email_e.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_compress_email_e latency_stxbtree_compress_email_e.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt

#stxbtree compress url=====================================================================
stxbtree_compress_url_a.o: stxbtree_compress_url_a.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compress_url_a.o stxbtree_compress_url_a.cc

stxbtree_compress_url_a: stxbtree_compress_url_a.o
	$(CXX) $(CFLAGS) -o stxbtree_compress_url_a stxbtree_compress_url_a.o $(SNAPPY) $(MEMMGR) -lpthread -lm

stxbtree_compress_url_c.o: stxbtree_compress_url_c.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compress_url_c.o stxbtree_compress_url_c.cc

stxbtree_compress_url_c: stxbtree_compress_url_c.o
	$(CXX) $(CFLAGS) -o stxbtree_compress_url_c stxbtree_compress_url_c.o $(SNAPPY) $(MEMMGR) -lpthread -lm

stxbtree_compress_url_e.o: stxbtree_compress_url_e.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_compress_url_e.o stxbtree_compress_url_e.cc

stxbtree_compress_url_e: stxbtree_compress_url_e.o
	$(CXX) $(CFLAGS) -o stxbtree_compress_url_e stxbtree_compress_url_e.o $(SNAPPY) $(MEMMGR) -lpthread -lm


#stxbtree multi original random int=====================================================================
stxbtree_multi_ori_random_int_a.o: stxbtree_multi_ori_random_int_a.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_ori_random_int_a.o stxbtree_multi_ori_random_int_a.cc

stxbtree_multi_ori_random_int_a: stxbtree_multi_ori_random_int_a.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_ori_random_int_a stxbtree_multi_ori_random_int_a.o $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_ori_random_int_a.o: latency_stxbtree_multi_ori_random_int_a.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_ori_random_int_a.o latency_stxbtree_multi_ori_random_int_a.cc

latency_stxbtree_multi_ori_random_int_a: latency_stxbtree_multi_ori_random_int_a.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_ori_random_int_a latency_stxbtree_multi_ori_random_int_a.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_multi_ori_random_int_c.o: stxbtree_multi_ori_random_int_c.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_ori_random_int_c.o stxbtree_multi_ori_random_int_c.cc

stxbtree_multi_ori_random_int_c: stxbtree_multi_ori_random_int_c.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_ori_random_int_c stxbtree_multi_ori_random_int_c.o $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_ori_random_int_c.o: latency_stxbtree_multi_ori_random_int_c.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_ori_random_int_c.o latency_stxbtree_multi_ori_random_int_c.cc

latency_stxbtree_multi_ori_random_int_c: latency_stxbtree_multi_ori_random_int_c.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_ori_random_int_c latency_stxbtree_multi_ori_random_int_c.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_multi_ori_random_int_e.o: stxbtree_multi_ori_random_int_e.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_ori_random_int_e.o stxbtree_multi_ori_random_int_e.cc

stxbtree_multi_ori_random_int_e: stxbtree_multi_ori_random_int_e.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_ori_random_int_e stxbtree_multi_ori_random_int_e.o $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_ori_random_int_e.o: latency_stxbtree_multi_ori_random_int_e.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_ori_random_int_e.o latency_stxbtree_multi_ori_random_int_e.cc

latency_stxbtree_multi_ori_random_int_e: latency_stxbtree_multi_ori_random_int_e.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_ori_random_int_e latency_stxbtree_multi_ori_random_int_e.o $(MEMMGR) -lpthread -lm -lrt

#stxbtree multi original mono inc int=====================================================================
stxbtree_multi_ori_monoinc_int_a.o: stxbtree_multi_ori_monoinc_int_a.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_ori_monoinc_int_a.o stxbtree_multi_ori_monoinc_int_a.cc

stxbtree_multi_ori_monoinc_int_a: stxbtree_multi_ori_monoinc_int_a.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_ori_monoinc_int_a stxbtree_multi_ori_monoinc_int_a.o $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_ori_monoinc_int_a.o: latency_stxbtree_multi_ori_monoinc_int_a.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_ori_monoinc_int_a.o latency_stxbtree_multi_ori_monoinc_int_a.cc

latency_stxbtree_multi_ori_monoinc_int_a: latency_stxbtree_multi_ori_monoinc_int_a.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_ori_monoinc_int_a latency_stxbtree_multi_ori_monoinc_int_a.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_multi_ori_monoinc_int_c.o: stxbtree_multi_ori_monoinc_int_c.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_ori_monoinc_int_c.o stxbtree_multi_ori_monoinc_int_c.cc

stxbtree_multi_ori_monoinc_int_c: stxbtree_multi_ori_monoinc_int_c.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_ori_monoinc_int_c stxbtree_multi_ori_monoinc_int_c.o $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_ori_monoinc_int_c.o: latency_stxbtree_multi_ori_monoinc_int_c.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_ori_monoinc_int_c.o latency_stxbtree_multi_ori_monoinc_int_c.cc

latency_stxbtree_multi_ori_monoinc_int_c: latency_stxbtree_multi_ori_monoinc_int_c.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_ori_monoinc_int_c latency_stxbtree_multi_ori_monoinc_int_c.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_multi_ori_monoinc_int_e.o: stxbtree_multi_ori_monoinc_int_e.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_ori_monoinc_int_e.o stxbtree_multi_ori_monoinc_int_e.cc

stxbtree_multi_ori_monoinc_int_e: stxbtree_multi_ori_monoinc_int_e.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_ori_monoinc_int_e stxbtree_multi_ori_monoinc_int_e.o $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_ori_monoinc_int_e.o: latency_stxbtree_multi_ori_monoinc_int_e.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_ori_monoinc_int_e.o latency_stxbtree_multi_ori_monoinc_int_e.cc

latency_stxbtree_multi_ori_monoinc_int_e: latency_stxbtree_multi_ori_monoinc_int_e.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_ori_monoinc_int_e latency_stxbtree_multi_ori_monoinc_int_e.o $(MEMMGR) -lpthread -lm -lrt

#stxbtree multi original random string=====================================================================
stxbtree_multi_ori_random_str_a.o: stxbtree_multi_ori_random_str_a.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_ori_random_str_a.o stxbtree_multi_ori_random_str_a.cc

stxbtree_multi_ori_random_str_a: stxbtree_multi_ori_random_str_a.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_ori_random_str_a stxbtree_multi_ori_random_str_a.o $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_ori_random_str_a.o: latency_stxbtree_multi_ori_random_str_a.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_ori_random_str_a.o latency_stxbtree_multi_ori_random_str_a.cc

latency_stxbtree_multi_ori_random_str_a: latency_stxbtree_multi_ori_random_str_a.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_ori_random_str_a latency_stxbtree_multi_ori_random_str_a.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_multi_ori_random_str_c.o: stxbtree_multi_ori_random_str_c.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_ori_random_str_c.o stxbtree_multi_ori_random_str_c.cc

stxbtree_multi_ori_random_str_c: stxbtree_multi_ori_random_str_c.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_ori_random_str_c stxbtree_multi_ori_random_str_c.o $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_ori_random_str_c.o: latency_stxbtree_multi_ori_random_str_c.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_ori_random_str_c.o latency_stxbtree_multi_ori_random_str_c.cc

latency_stxbtree_multi_ori_random_str_c: latency_stxbtree_multi_ori_random_str_c.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_ori_random_str_c latency_stxbtree_multi_ori_random_str_c.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_multi_ori_random_str_e.o: stxbtree_multi_ori_random_str_e.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_ori_random_str_e.o stxbtree_multi_ori_random_str_e.cc

stxbtree_multi_ori_random_str_e: stxbtree_multi_ori_random_str_e.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_ori_random_str_e stxbtree_multi_ori_random_str_e.o $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_ori_random_str_e.o: latency_stxbtree_multi_ori_random_str_e.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_ori_random_str_e.o latency_stxbtree_multi_ori_random_str_e.cc

latency_stxbtree_multi_ori_random_str_e: latency_stxbtree_multi_ori_random_str_e.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_ori_random_str_e latency_stxbtree_multi_ori_random_str_e.o $(MEMMGR) -lpthread -lm -lrt

#stxbtree multi original email=====================================================================
stxbtree_multi_ori_email_a.o: stxbtree_multi_ori_email_a.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_ori_email_a.o stxbtree_multi_ori_email_a.cc

stxbtree_multi_ori_email_a: stxbtree_multi_ori_email_a.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_ori_email_a stxbtree_multi_ori_email_a.o $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_ori_email_a.o: latency_stxbtree_multi_ori_email_a.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_ori_email_a.o latency_stxbtree_multi_ori_email_a.cc

latency_stxbtree_multi_ori_email_a: latency_stxbtree_multi_ori_email_a.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_ori_email_a latency_stxbtree_multi_ori_email_a.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_multi_ori_email_c.o: stxbtree_multi_ori_email_c.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_ori_email_c.o stxbtree_multi_ori_email_c.cc

stxbtree_multi_ori_email_c: stxbtree_multi_ori_email_c.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_ori_email_c stxbtree_multi_ori_email_c.o $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_ori_email_c.o: latency_stxbtree_multi_ori_email_c.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_ori_email_c.o latency_stxbtree_multi_ori_email_c.cc

latency_stxbtree_multi_ori_email_c: latency_stxbtree_multi_ori_email_c.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_ori_email_c latency_stxbtree_multi_ori_email_c.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_multi_ori_email_e.o: stxbtree_multi_ori_email_e.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_ori_email_e.o stxbtree_multi_ori_email_e.cc

stxbtree_multi_ori_email_e: stxbtree_multi_ori_email_e.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_ori_email_e stxbtree_multi_ori_email_e.o $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_ori_email_e.o: latency_stxbtree_multi_ori_email_e.cc microbench.hh stx/btree.h stx/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_ori_email_e.o latency_stxbtree_multi_ori_email_e.cc

latency_stxbtree_multi_ori_email_e: latency_stxbtree_multi_ori_email_e.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_ori_email_e latency_stxbtree_multi_ori_email_e.o $(MEMMGR) -lpthread -lm -lrt


#stxbtree multi compact random int=====================================================================
stxbtree_multi_compact_random_int_a.o: stxbtree_multi_compact_random_int_a.cc microbench.hh stx-compact-multi/btree.h stx-compact-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_compact_random_int_a.o stxbtree_multi_compact_random_int_a.cc

stxbtree_multi_compact_random_int_a: stxbtree_multi_compact_random_int_a.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_compact_random_int_a stxbtree_multi_compact_random_int_a.o $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_compact_random_int_a.o: latency_stxbtree_multi_compact_random_int_a.cc microbench.hh stx-compact-multi/btree.h stx-compact-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_compact_random_int_a.o latency_stxbtree_multi_compact_random_int_a.cc

latency_stxbtree_multi_compact_random_int_a: latency_stxbtree_multi_compact_random_int_a.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_compact_random_int_a latency_stxbtree_multi_compact_random_int_a.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_multi_compact_random_int_c.o: stxbtree_multi_compact_random_int_c.cc microbench.hh stx-compact-multi/btree.h stx-compact-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_compact_random_int_c.o stxbtree_multi_compact_random_int_c.cc

stxbtree_multi_compact_random_int_c: stxbtree_multi_compact_random_int_c.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_compact_random_int_c stxbtree_multi_compact_random_int_c.o $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_compact_random_int_c.o: latency_stxbtree_multi_compact_random_int_c.cc microbench.hh stx-compact-multi/btree.h stx-compact-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_compact_random_int_c.o latency_stxbtree_multi_compact_random_int_c.cc

latency_stxbtree_multi_compact_random_int_c: latency_stxbtree_multi_compact_random_int_c.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_compact_random_int_c latency_stxbtree_multi_compact_random_int_c.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_multi_compact_random_int_e.o: stxbtree_multi_compact_random_int_e.cc microbench.hh stx-compact-multi/btree.h stx-compact-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_compact_random_int_e.o stxbtree_multi_compact_random_int_e.cc

stxbtree_multi_compact_random_int_e: stxbtree_multi_compact_random_int_e.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_compact_random_int_e stxbtree_multi_compact_random_int_e.o $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_compact_random_int_e.o: latency_stxbtree_multi_compact_random_int_e.cc microbench.hh stx-compact-multi/btree.h stx-compact-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_compact_random_int_e.o latency_stxbtree_multi_compact_random_int_e.cc

latency_stxbtree_multi_compact_random_int_e: latency_stxbtree_multi_compact_random_int_e.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_compact_random_int_e latency_stxbtree_multi_compact_random_int_e.o $(MEMMGR) -lpthread -lm -lrt

#stxbtree multi compact mono inc int=====================================================================
stxbtree_multi_compact_monoinc_int_a.o: stxbtree_multi_compact_monoinc_int_a.cc microbench.hh stx-compact-multi/btree.h stx-compact-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_compact_monoinc_int_a.o stxbtree_multi_compact_monoinc_int_a.cc

stxbtree_multi_compact_monoinc_int_a: stxbtree_multi_compact_monoinc_int_a.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_compact_monoinc_int_a stxbtree_multi_compact_monoinc_int_a.o $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_compact_monoinc_int_a.o: latency_stxbtree_multi_compact_monoinc_int_a.cc microbench.hh stx-compact-multi/btree.h stx-compact-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_compact_monoinc_int_a.o latency_stxbtree_multi_compact_monoinc_int_a.cc

latency_stxbtree_multi_compact_monoinc_int_a: latency_stxbtree_multi_compact_monoinc_int_a.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_compact_monoinc_int_a latency_stxbtree_multi_compact_monoinc_int_a.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_multi_compact_monoinc_int_c.o: stxbtree_multi_compact_monoinc_int_c.cc microbench.hh stx-compact-multi/btree.h stx-compact-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_compact_monoinc_int_c.o stxbtree_multi_compact_monoinc_int_c.cc

stxbtree_multi_compact_monoinc_int_c: stxbtree_multi_compact_monoinc_int_c.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_compact_monoinc_int_c stxbtree_multi_compact_monoinc_int_c.o $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_compact_monoinc_int_c.o: latency_stxbtree_multi_compact_monoinc_int_c.cc microbench.hh stx-compact-multi/btree.h stx-compact-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_compact_monoinc_int_c.o latency_stxbtree_multi_compact_monoinc_int_c.cc

latency_stxbtree_multi_compact_monoinc_int_c: latency_stxbtree_multi_compact_monoinc_int_c.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_compact_monoinc_int_c latency_stxbtree_multi_compact_monoinc_int_c.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_multi_compact_monoinc_int_e.o: stxbtree_multi_compact_monoinc_int_e.cc microbench.hh stx-compact-multi/btree.h stx-compact-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_compact_monoinc_int_e.o stxbtree_multi_compact_monoinc_int_e.cc

stxbtree_multi_compact_monoinc_int_e: stxbtree_multi_compact_monoinc_int_e.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_compact_monoinc_int_e stxbtree_multi_compact_monoinc_int_e.o $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_compact_monoinc_int_e.o: latency_stxbtree_multi_compact_monoinc_int_e.cc microbench.hh stx-compact-multi/btree.h stx-compact-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_compact_monoinc_int_e.o latency_stxbtree_multi_compact_monoinc_int_e.cc

latency_stxbtree_multi_compact_monoinc_int_e: latency_stxbtree_multi_compact_monoinc_int_e.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_compact_monoinc_int_e latency_stxbtree_multi_compact_monoinc_int_e.o $(MEMMGR) -lpthread -lm -lrt

#stxbtree multi compact random string=====================================================================
stxbtree_multi_compact_random_str_a.o: stxbtree_multi_compact_random_str_a.cc microbench.hh stx-compact-multi/btree.h stx-compact-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_compact_random_str_a.o stxbtree_multi_compact_random_str_a.cc

stxbtree_multi_compact_random_str_a: stxbtree_multi_compact_random_str_a.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_compact_random_str_a stxbtree_multi_compact_random_str_a.o $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_compact_random_str_a.o: latency_stxbtree_multi_compact_random_str_a.cc microbench.hh stx-compact-multi/btree.h stx-compact-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_compact_random_str_a.o latency_stxbtree_multi_compact_random_str_a.cc

latency_stxbtree_multi_compact_random_str_a: latency_stxbtree_multi_compact_random_str_a.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_compact_random_str_a latency_stxbtree_multi_compact_random_str_a.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_multi_compact_random_str_c.o: stxbtree_multi_compact_random_str_c.cc microbench.hh stx-compact-multi/btree.h stx-compact-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_compact_random_str_c.o stxbtree_multi_compact_random_str_c.cc

stxbtree_multi_compact_random_str_c: stxbtree_multi_compact_random_str_c.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_compact_random_str_c stxbtree_multi_compact_random_str_c.o $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_compact_random_str_c.o: latency_stxbtree_multi_compact_random_str_c.cc microbench.hh stx-compact-multi/btree.h stx-compact-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_compact_random_str_c.o latency_stxbtree_multi_compact_random_str_c.cc

latency_stxbtree_multi_compact_random_str_c: latency_stxbtree_multi_compact_random_str_c.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_compact_random_str_c latency_stxbtree_multi_compact_random_str_c.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_multi_compact_random_str_e.o: stxbtree_multi_compact_random_str_e.cc microbench.hh stx-compact-multi/btree.h stx-compact-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_compact_random_str_e.o stxbtree_multi_compact_random_str_e.cc

stxbtree_multi_compact_random_str_e: stxbtree_multi_compact_random_str_e.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_compact_random_str_e stxbtree_multi_compact_random_str_e.o $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_compact_random_str_e.o: latency_stxbtree_multi_compact_random_str_e.cc microbench.hh stx-compact-multi/btree.h stx-compact-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_compact_random_str_e.o latency_stxbtree_multi_compact_random_str_e.cc

latency_stxbtree_multi_compact_random_str_e: latency_stxbtree_multi_compact_random_str_e.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_compact_random_str_e latency_stxbtree_multi_compact_random_str_e.o $(MEMMGR) -lpthread -lm -lrt

#stxbtree multi compact email=====================================================================
stxbtree_multi_compact_email_a.o: stxbtree_multi_compact_email_a.cc microbench.hh stx-compact-multi/btree.h stx-compact-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_compact_email_a.o stxbtree_multi_compact_email_a.cc

stxbtree_multi_compact_email_a: stxbtree_multi_compact_email_a.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_compact_email_a stxbtree_multi_compact_email_a.o $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_compact_email_a.o: latency_stxbtree_multi_compact_email_a.cc microbench.hh stx-compact-multi/btree.h stx-compact-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_compact_email_a.o latency_stxbtree_multi_compact_email_a.cc

latency_stxbtree_multi_compact_email_a: latency_stxbtree_multi_compact_email_a.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_compact_email_a latency_stxbtree_multi_compact_email_a.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_multi_compact_email_c.o: stxbtree_multi_compact_email_c.cc microbench.hh stx-compact-multi/btree.h stx-compact-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_compact_email_c.o stxbtree_multi_compact_email_c.cc

stxbtree_multi_compact_email_c: stxbtree_multi_compact_email_c.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_compact_email_c stxbtree_multi_compact_email_c.o $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_compact_email_c.o: latency_stxbtree_multi_compact_email_c.cc microbench.hh stx-compact-multi/btree.h stx-compact-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_compact_email_c.o latency_stxbtree_multi_compact_email_c.cc

latency_stxbtree_multi_compact_email_c: latency_stxbtree_multi_compact_email_c.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_compact_email_c latency_stxbtree_multi_compact_email_c.o $(MEMMGR) -lpthread -lm -lrt

stxbtree_multi_compact_email_e.o: stxbtree_multi_compact_email_e.cc microbench.hh stx-compact-multi/btree.h stx-compact-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_compact_email_e.o stxbtree_multi_compact_email_e.cc

stxbtree_multi_compact_email_e: stxbtree_multi_compact_email_e.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_compact_email_e stxbtree_multi_compact_email_e.o $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_compact_email_e.o: latency_stxbtree_multi_compact_email_e.cc microbench.hh stx-compact-multi/btree.h stx-compact-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_compact_email_e.o latency_stxbtree_multi_compact_email_e.cc

latency_stxbtree_multi_compact_email_e: latency_stxbtree_multi_compact_email_e.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_compact_email_e latency_stxbtree_multi_compact_email_e.o $(MEMMGR) -lpthread -lm -lrt


#stxbtree multi compress random int=====================================================================
stxbtree_multi_compress_random_int_a.o: stxbtree_multi_compress_random_int_a.cc microbench.hh stx-compress-multi/btree.h stx-compress-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_compress_random_int_a.o stxbtree_multi_compress_random_int_a.cc

stxbtree_multi_compress_random_int_a: stxbtree_multi_compress_random_int_a.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_compress_random_int_a stxbtree_multi_compress_random_int_a.o $(SNAPPY) $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_compress_random_int_a.o: latency_stxbtree_multi_compress_random_int_a.cc microbench.hh stx-compress-multi/btree.h stx-compress-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_compress_random_int_a.o latency_stxbtree_multi_compress_random_int_a.cc

latency_stxbtree_multi_compress_random_int_a: latency_stxbtree_multi_compress_random_int_a.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_compress_random_int_a latency_stxbtree_multi_compress_random_int_a.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt

stxbtree_multi_compress_random_int_c.o: stxbtree_multi_compress_random_int_c.cc microbench.hh stx-compress-multi/btree.h stx-compress-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_compress_random_int_c.o stxbtree_multi_compress_random_int_c.cc

stxbtree_multi_compress_random_int_c: stxbtree_multi_compress_random_int_c.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_compress_random_int_c stxbtree_multi_compress_random_int_c.o $(SNAPPY) $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_compress_random_int_c.o: latency_stxbtree_multi_compress_random_int_c.cc microbench.hh stx-compress-multi/btree.h stx-compress-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_compress_random_int_c.o latency_stxbtree_multi_compress_random_int_c.cc

latency_stxbtree_multi_compress_random_int_c: latency_stxbtree_multi_compress_random_int_c.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_compress_random_int_c latency_stxbtree_multi_compress_random_int_c.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt

stxbtree_multi_compress_random_int_e.o: stxbtree_multi_compress_random_int_e.cc microbench.hh stx-compress-multi/btree.h stx-compress-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_compress_random_int_e.o stxbtree_multi_compress_random_int_e.cc

stxbtree_multi_compress_random_int_e: stxbtree_multi_compress_random_int_e.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_compress_random_int_e stxbtree_multi_compress_random_int_e.o $(SNAPPY) $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_compress_random_int_e.o: latency_stxbtree_multi_compress_random_int_e.cc microbench.hh stx-compress-multi/btree.h stx-compress-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_compress_random_int_e.o latency_stxbtree_multi_compress_random_int_e.cc

latency_stxbtree_multi_compress_random_int_e: latency_stxbtree_multi_compress_random_int_e.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_compress_random_int_e latency_stxbtree_multi_compress_random_int_e.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt

#stxbtree multi compress mono inc int=====================================================================
stxbtree_multi_compress_monoinc_int_a.o: stxbtree_multi_compress_monoinc_int_a.cc microbench.hh stx-compress-multi/btree.h stx-compress-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_compress_monoinc_int_a.o stxbtree_multi_compress_monoinc_int_a.cc

stxbtree_multi_compress_monoinc_int_a: stxbtree_multi_compress_monoinc_int_a.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_compress_monoinc_int_a stxbtree_multi_compress_monoinc_int_a.o $(SNAPPY) $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_compress_monoinc_int_a.o: latency_stxbtree_multi_compress_monoinc_int_a.cc microbench.hh stx-compress-multi/btree.h stx-compress-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_compress_monoinc_int_a.o latency_stxbtree_multi_compress_monoinc_int_a.cc

latency_stxbtree_multi_compress_monoinc_int_a: latency_stxbtree_multi_compress_monoinc_int_a.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_compress_monoinc_int_a latency_stxbtree_multi_compress_monoinc_int_a.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt

stxbtree_multi_compress_monoinc_int_c.o: stxbtree_multi_compress_monoinc_int_c.cc microbench.hh stx-compress-multi/btree.h stx-compress-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_compress_monoinc_int_c.o stxbtree_multi_compress_monoinc_int_c.cc

stxbtree_multi_compress_monoinc_int_c: stxbtree_multi_compress_monoinc_int_c.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_compress_monoinc_int_c stxbtree_multi_compress_monoinc_int_c.o $(SNAPPY) $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_compress_monoinc_int_c.o: latency_stxbtree_multi_compress_monoinc_int_c.cc microbench.hh stx-compress-multi/btree.h stx-compress-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_compress_monoinc_int_c.o latency_stxbtree_multi_compress_monoinc_int_c.cc

latency_stxbtree_multi_compress_monoinc_int_c: latency_stxbtree_multi_compress_monoinc_int_c.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_compress_monoinc_int_c latency_stxbtree_multi_compress_monoinc_int_c.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt

stxbtree_multi_compress_monoinc_int_e.o: stxbtree_multi_compress_monoinc_int_e.cc microbench.hh stx-compress-multi/btree.h stx-compress-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_compress_monoinc_int_e.o stxbtree_multi_compress_monoinc_int_e.cc

stxbtree_multi_compress_monoinc_int_e: stxbtree_multi_compress_monoinc_int_e.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_compress_monoinc_int_e stxbtree_multi_compress_monoinc_int_e.o $(SNAPPY) $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_compress_monoinc_int_e.o: latency_stxbtree_multi_compress_monoinc_int_e.cc microbench.hh stx-compress-multi/btree.h stx-compress-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_compress_monoinc_int_e.o latency_stxbtree_multi_compress_monoinc_int_e.cc

latency_stxbtree_multi_compress_monoinc_int_e: latency_stxbtree_multi_compress_monoinc_int_e.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_compress_monoinc_int_e latency_stxbtree_multi_compress_monoinc_int_e.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt

#stxbtree multi compress random string=====================================================================
stxbtree_multi_compress_random_str_a.o: stxbtree_multi_compress_random_str_a.cc microbench.hh stx-compress-multi/btree.h stx-compress-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_compress_random_str_a.o stxbtree_multi_compress_random_str_a.cc

stxbtree_multi_compress_random_str_a: stxbtree_multi_compress_random_str_a.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_compress_random_str_a stxbtree_multi_compress_random_str_a.o $(SNAPPY) $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_compress_random_str_a.o: latency_stxbtree_multi_compress_random_str_a.cc microbench.hh stx-compress-multi/btree.h stx-compress-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_compress_random_str_a.o latency_stxbtree_multi_compress_random_str_a.cc

latency_stxbtree_multi_compress_random_str_a: latency_stxbtree_multi_compress_random_str_a.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_compress_random_str_a latency_stxbtree_multi_compress_random_str_a.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt

stxbtree_multi_compress_random_str_c.o: stxbtree_multi_compress_random_str_c.cc microbench.hh stx-compress-multi/btree.h stx-compress-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_compress_random_str_c.o stxbtree_multi_compress_random_str_c.cc

stxbtree_multi_compress_random_str_c: stxbtree_multi_compress_random_str_c.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_compress_random_str_c stxbtree_multi_compress_random_str_c.o $(SNAPPY) $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_compress_random_str_c.o: latency_stxbtree_multi_compress_random_str_c.cc microbench.hh stx-compress-multi/btree.h stx-compress-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_compress_random_str_c.o latency_stxbtree_multi_compress_random_str_c.cc

latency_stxbtree_multi_compress_random_str_c: latency_stxbtree_multi_compress_random_str_c.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_compress_random_str_c latency_stxbtree_multi_compress_random_str_c.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt

stxbtree_multi_compress_random_str_e.o: stxbtree_multi_compress_random_str_e.cc microbench.hh stx-compress-multi/btree.h stx-compress-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_compress_random_str_e.o stxbtree_multi_compress_random_str_e.cc

stxbtree_multi_compress_random_str_e: stxbtree_multi_compress_random_str_e.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_compress_random_str_e stxbtree_multi_compress_random_str_e.o $(SNAPPY) $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_compress_random_str_e.o: latency_stxbtree_multi_compress_random_str_e.cc microbench.hh stx-compress-multi/btree.h stx-compress-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_compress_random_str_e.o latency_stxbtree_multi_compress_random_str_e.cc

latency_stxbtree_multi_compress_random_str_e: latency_stxbtree_multi_compress_random_str_e.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_compress_random_str_e latency_stxbtree_multi_compress_random_str_e.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt

#stxbtree multi compress email=====================================================================
stxbtree_multi_compress_email_a.o: stxbtree_multi_compress_email_a.cc microbench.hh stx-compress-multi/btree.h stx-compress-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_compress_email_a.o stxbtree_multi_compress_email_a.cc

stxbtree_multi_compress_email_a: stxbtree_multi_compress_email_a.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_compress_email_a stxbtree_multi_compress_email_a.o $(SNAPPY) $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_compress_email_a.o: latency_stxbtree_multi_compress_email_a.cc microbench.hh stx-compress-multi/btree.h stx-compress-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_compress_email_a.o latency_stxbtree_multi_compress_email_a.cc

latency_stxbtree_multi_compress_email_a: latency_stxbtree_multi_compress_email_a.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_compress_email_a latency_stxbtree_multi_compress_email_a.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt

stxbtree_multi_compress_email_c.o: stxbtree_multi_compress_email_c.cc microbench.hh stx-compress-multi/btree.h stx-compress-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_compress_email_c.o stxbtree_multi_compress_email_c.cc

stxbtree_multi_compress_email_c: stxbtree_multi_compress_email_c.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_compress_email_c stxbtree_multi_compress_email_c.o $(SNAPPY) $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_compress_email_c.o: latency_stxbtree_multi_compress_email_c.cc microbench.hh stx-compress-multi/btree.h stx-compress-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_compress_email_c.o latency_stxbtree_multi_compress_email_c.cc

latency_stxbtree_multi_compress_email_c: latency_stxbtree_multi_compress_email_c.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_compress_email_c latency_stxbtree_multi_compress_email_c.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt

stxbtree_multi_compress_email_e.o: stxbtree_multi_compress_email_e.cc microbench.hh stx-compress-multi/btree.h stx-compress-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o stxbtree_multi_compress_email_e.o stxbtree_multi_compress_email_e.cc

stxbtree_multi_compress_email_e: stxbtree_multi_compress_email_e.o
	$(CXX) $(CFLAGS) -o stxbtree_multi_compress_email_e stxbtree_multi_compress_email_e.o $(SNAPPY) $(MEMMGR) -lpthread -lm

latency_stxbtree_multi_compress_email_e.o: latency_stxbtree_multi_compress_email_e.cc microbench.hh stx-compress-multi/btree.h stx-compress-multi/btree_map.h 
	$(CXX) $(CFLAGS) -c -o latency_stxbtree_multi_compress_email_e.o latency_stxbtree_multi_compress_email_e.cc

latency_stxbtree_multi_compress_email_e: latency_stxbtree_multi_compress_email_e.o
	$(CXX) $(CFLAGS) -o latency_stxbtree_multi_compress_email_e latency_stxbtree_multi_compress_email_e.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt


#stxbtree merge time=====================================================================================================
merge_time_stxbtree_compact.o: merge_time_stxbtree_compact.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o merge_time_stxbtree_compact.o merge_time_stxbtree_compact.cc

merge_time_stxbtree_compact: merge_time_stxbtree_compact.o
	$(CXX) $(CFLAGS) -o merge_time_stxbtree_compact merge_time_stxbtree_compact.o $(MEMMGR) -lpthread -lm -lrt

merge_time_stxbtree_compress.o: merge_time_stxbtree_compress.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o merge_time_stxbtree_compress.o merge_time_stxbtree_compress.cc

merge_time_stxbtree_compress: merge_time_stxbtree_compress.o
	$(CXX) $(CFLAGS) -o merge_time_stxbtree_compress merge_time_stxbtree_compress.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt

#stxbtree merge ratio=====================================================================================================
merge_ratio_stxbtree_compact.o: merge_ratio_stxbtree_compact.cc microbench.hh stx-compact/btree.h stx-compact/btree_map.h 
	$(CXX) $(CFLAGS) -c -o merge_ratio_stxbtree_compact.o merge_ratio_stxbtree_compact.cc

merge_ratio_stxbtree_compact: merge_ratio_stxbtree_compact.o
	$(CXX) $(CFLAGS) -o merge_ratio_stxbtree_compact merge_ratio_stxbtree_compact.o $(MEMMGR) -lpthread -lm -lrt

merge_ratio_stxbtree_compress.o: merge_ratio_stxbtree_compress.cc microbench.hh stx-compress/btree.h stx-compress/btree_map.h 
	$(CXX) $(CFLAGS) -c -o merge_ratio_stxbtree_compress.o merge_ratio_stxbtree_compress.cc

merge_ratio_stxbtree_compress: merge_ratio_stxbtree_compress.o
	$(CXX) $(CFLAGS) -o merge_ratio_stxbtree_compress merge_ratio_stxbtree_compress.o $(SNAPPY) $(MEMMGR) -lpthread -lm -lrt


clean:
	$(RM) stxbtree_ori_random_int_a stxbtree_ori_random_int_c stxbtree_ori_random_int_e stxbtree_ori_monoinc_int_a stxbtree_ori_monoinc_int_c stxbtree_ori_monoinc_int_e stxbtree_ori_random_str_a stxbtree_ori_random_str_c stxbtree_ori_random_str_e stxbtree_ori_email_a stxbtree_ori_email_c stxbtree_ori_email_e stxbtree_ori_url_a stxbtree_ori_url_c stxbtree_ori_url_e stxbtree_compact_random_int_a stxbtree_compact_random_int_c stxbtree_compact_random_int_e stxbtree_compact_monoinc_int_a stxbtree_compact_monoinc_int_c stxbtree_compact_monoinc_int_e stxbtree_compact_random_str_a stxbtree_compact_random_str_c stxbtree_compact_random_str_e stxbtree_compact_email_a stxbtree_compact_email_c stxbtree_compact_email_e stxbtree_compact_url_a stxbtree_compact_url_c stxbtree_compact_url_e stxbtree_compress_random_int_a stxbtree_compress_random_int_c stxbtree_compress_random_int_e stxbtree_compress_random_int_a stxbtree_compress_random_int_c stxbtree_compress_random_int_e stxbtree_compress_monoinc_int_a stxbtree_compress_monoinc_int_c stxbtree_compress_monoinc_int_e stxbtree_compress_random_str_a stxbtree_compress_random_str_c stxbtree_compress_random_str_e stxbtree_compress_email_a stxbtree_compress_email_c stxbtree_compress_email_e stxbtree_compress_url_a stxbtree_compress_url_c stxbtree_compress_url_e stxbtree_multi_ori_random_int_a stxbtree_multi_ori_random_int_c stxbtree_multi_ori_random_int_e stxbtree_multi_ori_monoinc_int_a stxbtree_multi_ori_monoinc_int_c stxbtree_multi_ori_monoinc_int_e stxbtree_multi_ori_random_str_a stxbtree_multi_ori_random_str_c stxbtree_multi_ori_random_str_e stxbtree_multi_ori_email_a stxbtree_multi_ori_email_c stxbtree_multi_ori_email_e stxbtree_multi_compact_random_int_a stxbtree_multi_compact_random_int_c stxbtree_multi_compact_random_int_e stxbtree_multi_compact_monoinc_int_a stxbtree_multi_compact_monoinc_int_c stxbtree_multi_compact_monoinc_int_e stxbtree_multi_compact_random_str_a stxbtree_multi_compact_random_str_c stxbtree_multi_compact_random_str_e stxbtree_multi_compact_email_a stxbtree_multi_compact_email_c stxbtree_multi_compact_email_e stxbtree_multi_compress_random_int_a stxbtree_multi_compress_random_int_c stxbtree_multi_compress_random_int_e stxbtree_multi_compress_monoinc_int_a stxbtree_multi_compress_monoinc_int_c stxbtree_multi_compress_monoinc_int_e stxbtree_multi_compress_random_str_a stxbtree_multi_compress_random_str_c stxbtree_multi_compress_random_str_e stxbtree_multi_compress_email_a stxbtree_multi_compress_email_c stxbtree_multi_compress_email_e latency_stxbtree_ori_random_int_a latency_stxbtree_ori_random_int_c latency_stxbtree_ori_random_int_e latency_stxbtree_ori_monoinc_int_a latency_stxbtree_ori_monoinc_int_c latency_stxbtree_ori_monoinc_int_e latency_stxbtree_ori_random_str_a latency_stxbtree_ori_random_str_c latency_stxbtree_ori_random_str_e latency_stxbtree_ori_email_a latency_stxbtree_ori_email_c latency_stxbtree_ori_email_e latency_stxbtree_compact_random_int_a latency_stxbtree_compact_random_int_c latency_stxbtree_compact_random_int_e latency_stxbtree_compact_monoinc_int_a latency_stxbtree_compact_monoinc_int_c latency_stxbtree_compact_monoinc_int_e latency_stxbtree_compact_random_str_a latency_stxbtree_compact_random_str_c latency_stxbtree_compact_random_str_e latency_stxbtree_compact_email_a latency_stxbtree_compact_email_c latency_stxbtree_compact_email_e latency_stxbtree_compress_random_int_a latency_stxbtree_compress_random_int_c latency_stxbtree_compress_random_int_e latency_stxbtree_compress_monoinc_int_a latency_stxbtree_compress_monoinc_int_c latency_stxbtree_compress_monoinc_int_e latency_stxbtree_compress_random_str_a latency_stxbtree_compress_random_str_c latency_stxbtree_compress_random_str_e latency_stxbtree_compress_email_a latency_stxbtree_compress_email_c latency_stxbtree_compress_email_e latency_stxbtree_multi_ori_random_int_a latency_stxbtree_multi_ori_random_int_c latency_stxbtree_multi_ori_random_int_e latency_stxbtree_multi_ori_monoinc_int_a latency_stxbtree_multi_ori_monoinc_int_c latency_stxbtree_multi_ori_monoinc_int_e latency_stxbtree_multi_ori_random_str_a latency_stxbtree_multi_ori_random_str_c latency_stxbtree_multi_ori_random_str_e latency_stxbtree_multi_ori_email_a latency_stxbtree_multi_ori_email_c latency_stxbtree_multi_ori_email_e latency_stxbtree_multi_compact_random_int_a latency_stxbtree_multi_compact_random_int_c latency_stxbtree_multi_compact_random_int_e latency_stxbtree_multi_compact_monoinc_int_a latency_stxbtree_multi_compact_monoinc_int_c latency_stxbtree_multi_compact_monoinc_int_e latency_stxbtree_multi_compact_random_str_a latency_stxbtree_multi_compact_random_str_c latency_stxbtree_multi_compact_random_str_e latency_stxbtree_multi_compact_email_a latency_stxbtree_multi_compact_email_c latency_stxbtree_multi_compact_email_e latency_stxbtree_multi_compress_random_int_a latency_stxbtree_multi_compress_random_int_c latency_stxbtree_multi_compress_random_int_e latency_stxbtree_multi_compress_monoinc_int_a latency_stxbtree_multi_compress_monoinc_int_c latency_stxbtree_multi_compress_monoinc_int_e latency_stxbtree_multi_compress_random_str_a latency_stxbtree_multi_compress_random_str_c latency_stxbtree_multi_compress_random_str_e latency_stxbtree_multi_compress_email_a latency_stxbtree_multi_compress_email_c latency_stxbtree_multi_compress_email_e merge_time_stxbtree_compact merge_time_stxbtree_compress merge_ratio_stxbtree_compact merge_ratio_stxbtree_compress *.o *~ *.d
