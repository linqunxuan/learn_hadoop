#!/usr/bin/python

import sys

tmp_str = ""
for line in sys.stdin:
        key, idx, val = line.strip().split('\t')
        if idx == '1':
            tmp_str = val
        elif idx == '2':
            print "\t".join([key, tmp_str, val])
            tmp_str = ""
