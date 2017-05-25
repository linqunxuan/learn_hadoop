#!/bin/bash

set -e -x
HADOOP_CMD="/usr/local/hadoop-1.2.1/bin/hadoop"
STREAM_JAR_PATH="/usr/local/hadoop-1.2.1/contrib/streaming/hadoop-streaming-1.2.1.jar"

INPUT_FILE_PATH_1="/query_cookie_ip.txt.small"

OUTPUT_PATH="/output_ip_lib"

$HADOOP_CMD fs -rmr -skipTrash $OUTPUT_PATH

#step 1
$HADOOP_CMD jar $STREAM_JAR_PATH \
    -input $INPUT_FILE_PATH_1 \
    -output $OUTPUT_PATH \
    -mapper "python map.py mapper_func IPLIB" \
    -reducer "cat" \
    -jobconf "mapred.reduce.tasks=2" \
    -jobconf "mapreduce.reduce.memory.mb=5000" \
    -jobconf "mapred.job.name=ip_lib_demo" \
    -cacheFile "hdfs://master:9000/ip.lib.txt#IPLIB" \
    -file ./map.py \
    -file ./reduce.py
