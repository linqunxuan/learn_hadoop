#!/usr/bin/python

import sys

temp_num = 10000

for line in sys.stdin:
        key,val = line.strip().split('\t')
        newKey = 10000+ int(key)
        print "\t".join([str(newKey), val])


