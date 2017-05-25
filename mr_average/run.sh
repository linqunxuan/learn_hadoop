#!/bin/bash

set -e -x
HADOOP_CMD="/usr/local/hadoop-1.2.1/bin/hadoop"
STREAM_JAR_PATH="/usr/local/hadoop-1.2.1/contrib/streaming/hadoop-streaming-1.2.1.jar"

INPUT_FILE_PATH_1="/math.txt"
INPUT_FILE_PATH_2="/china.txt"
INPUT_FILE_PATH_3="/english.txt"

OUTPUT_PATH="/output_average"

#$HADOOP_CMD fs -rmr -skipTrash $OUTPUT_PATH

#step 1
$HADOOP_CMD jar $STREAM_JAR_PATH \
    -input $INPUT_FILE_PATH_1,$INPUT_FILE_PATH_2,$INPUT_FILE_PATH_3 \
    -output $OUTPUT_PATH \
    -mapper "python map.py" \
    -reducer "python reduce.py" \
    -jobconf "mapred.reduce.tasks=1" \
    -jobconf "mapred.job.name=average_reduce_demo" \
    -jobconf "stream.num.map.output.key.fields=1" \
    -jobconf "num.key.fields.for.partition=1" \
    -file ./map.py \
    -file ./reduce.py
