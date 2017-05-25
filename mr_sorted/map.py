#!/usr/bin/python
# -*- coding:utf-8 -*-

import sys


temp_num = 100000

def mapper_func():
    for line in sys.stdin:
        key = temp_num + int(line.strip())
        print "%s\t%s" % (key, "1")

if __name__ == "__main__":
    mapper_func()
