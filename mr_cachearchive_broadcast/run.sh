#!/bin/bash

HADOOP_CMD="/usr/local/hadoop-1.2.1/bin/hadoop"
STREAM_JAR_PATH="/usr/local/hadoop-1.2.1/contrib/streaming/hadoop-streaming-1.2.1.jar"

INPUT_FILE_PATH_1="/The_Man_of_Property.txt"
OUTPUT_PATH="/output_cachearchive_broadcast"

$HADOOP_CMD fs -rmr -skipTrash $OUTPUT_PATH

$HADOOP_CMD jar $STREAM_JAR_PATH \
    -input $INPUT_FILE_PATH_1 \
    -output $OUTPUT_PATH \
    -mapper "python map.py mapper_func WH.gz" \
    -reducer "python reduce.py reduce_func" \
    -jobconf "mapred.reduce.tasks=2" \
    -jobconf "mapred.job.name=cachearchive_demo" \
    -cacheArchive "hdfs://master:9000/w.tar.gz#WH.gz" \
    -file ./map.py \
    -file ./reduce.py
