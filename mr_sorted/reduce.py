#!/usr/bin/python

import sys

line_num = 0
temp_num = 100000
for line in sys.stdin:
    key, val = line.strip().split('\t')
    line_num += 1
    new_key = int(key) - temp_num
    print str(line_num) + "\t" + str(new_key)
