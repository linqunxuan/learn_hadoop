#!/bin/bash

set -e -x
HADOOP_CMD="/usr/local/hadoop-1.2.1/bin/hadoop"
STREAM_JAR_PATH="/usr/local/hadoop-1.2.1/contrib/streaming/hadoop-streaming-1.2.1.jar"
INPUT_FILE_PATH_1="/a.txt"
INPUT_FILE_PATH_2="/b.txt"
OUTPUT_PATH="/output_allsort_1reduce"

$HADOOP_CMD fs -rmr -skipTrash $OUTPUT_PATH

$HADOOP_CMD jar $STREAM_JAR_PATH \
    -input $INPUT_FILE_PATH_1,$INPUT_FILE_PATH_2 \
    -output $OUTPUT_PATH \
    -mapper "python map_sort.py" \
    -reducer "python reduce_sort.py" \
    -jobconf "mapred.reduce.tasks=1" \
    -jobconf "mapred.job.name=allsort_1reduce_demo" \
    -file ./map_sort.py \
    -file ./reduce_sort.py
