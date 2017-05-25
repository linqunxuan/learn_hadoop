#!/bin/bash

set -e -x
HADOOP_CMD="/usr/local/hadoop-1.2.1/bin/hadoop"
STREAM_JAR_PATH="/usr/local/hadoop-1.2.1/contrib/streaming/hadoop-streaming-1.2.1.jar"

INPUT_FILE_PATH_A="/a_join.txt"
INPUT_FILE_PATH_B="/b_join.txt"

OUTPUT_A_PATH="/output_a"
OUTPUT_B_PATH="/output_b"


OUTPUT_PATH="/output_join_reduce"

$HADOOP_CMD fs -rmr -skipTrash $OUTPUT_A_PATH $OUTPUT_B_PATH $OUTPUT_PATH

#step 1
$HADOOP_CMD jar $STREAM_JAR_PATH \
    -input $INPUT_FILE_PATH_A \
    -output $OUTPUT_A_PATH \
    -mapper "python map_a.py" \
    -file ./map_a.py \

# Step 2.
$HADOOP_CMD jar $STREAM_JAR_PATH \
    -input $INPUT_FILE_PATH_B \
    -output $OUTPUT_B_PATH \
    -mapper "python map_b.py" \
    -file ./map_b.py \

#step 3
$HADOOP_CMD jar $STREAM_JAR_PATH \
    -input $INPUT_FILE_PATH_A,$INPUT_FILE_PATH_B \
    -output $OUTPUT_PATH \
    -mapper "cat" \
    -reducer "python reduce_join.py" \
    -jobconf "mapred.reduce.tasks=1" \
    -jobconf "mapred.job.name=join_reduce_demo" \
    -jobconf "stream.num.map.output.key.fields=2" \
    -jobconf "num.key.fields.for.partition=1" \
    -file ./map_join.py \
    -file ./reduce_join.py
