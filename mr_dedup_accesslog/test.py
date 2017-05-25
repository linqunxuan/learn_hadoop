#!/usr/bin/python

import sys

for line in sys.stdin:
    str_list = line.strip().split(' ')
    print ("".join(str_list[-1:])).replace("\"", "")
    
