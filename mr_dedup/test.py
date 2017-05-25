#!/usr/bin/python

import sys

for line in sys.stdin:
    str_list = line.strip().split(' ')
    print type(str_list)
    print str_list
    
