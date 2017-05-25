#!/usr/bin/python

import sys

current_key = None
key_list = []
for line in sys.stdin:
    key, val = line.strip().split('\t')
    if key not in key_list:
        key_list.append(key)
        print key + "\t" + val

key_list = []
