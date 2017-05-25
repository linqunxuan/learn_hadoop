#!/usr/bin/python

import sys

temp_num = 10000

for line in sys.stdin:
        key,val = line.strip().split('\t')
        newKey = 10000+ int(key)
        red_idx = 1
        if newKey < (10000 + 10100) / 2:
            red_idx = 0
        print "\t".join([str(red_idx), str(newKey), val])
