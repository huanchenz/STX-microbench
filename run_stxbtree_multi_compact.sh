#!bin/bash

OUTPUT_FILE=./throughputs/stxbtree_multi_compact_efficient_256.txt

echo "./stxbtree_multi_compact_random_int_a"
./stxbtree_multi_compact_random_int_a > $OUTPUT_FILE

echo "./stxbtree_multi_compact_random_int_c"
./stxbtree_multi_compact_random_int_c >> $OUTPUT_FILE

echo "./stxbtree_multi_compact_random_int_e"
./stxbtree_multi_compact_random_int_e >> $OUTPUT_FILE

echo >> $OUTPUT_FILE

echo "./stxbtree_multi_compact_monoinc_int_a"
./stxbtree_multi_compact_monoinc_int_a >> $OUTPUT_FILE

echo "./stxbtree_multi_compact_monoinc_int_c"
./stxbtree_multi_compact_monoinc_int_c >> $OUTPUT_FILE

echo "./stxbtree_multi_compact_monoinc_int_e"
./stxbtree_multi_compact_monoinc_int_e >> $OUTPUT_FILE

echo >> $OUTPUT_FILE

echo "./stxbtree_multi_compact_random_str_a"
./stxbtree_multi_compact_random_str_a >> $OUTPUT_FILE

echo "./stxbtree_multi_compact_random_str_c"
./stxbtree_multi_compact_random_str_c >> $OUTPUT_FILE

echo "./stxbtree_multi_compact_random_str_e"
./stxbtree_multi_compact_random_str_e >> $OUTPUT_FILE

echo >> $OUTPUT_FILE

echo "./stxbtree_multi_compact_email_a"
./stxbtree_multi_compact_email_a >> $OUTPUT_FILE

echo "./stxbtree_multi_compact_email_c"
./stxbtree_multi_compact_email_c >> $OUTPUT_FILE

echo "./stxbtree_multi_compact_email_e"
./stxbtree_multi_compact_email_e >> $OUTPUT_FILE
