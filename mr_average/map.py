#!/usr/bin/python
# -*- coding:utf-8 -*-

import sys


temp_num = 100000

def mapper_func():
    for line in sys.stdin:
        key , val = line.strip().split('    ');
        print "%s\t%s" % (key, val)

if __name__ == "__main__":
    mapper_func()
