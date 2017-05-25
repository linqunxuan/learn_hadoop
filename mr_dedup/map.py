#!/usr/bin/python
# -*- coding:utf-8 -*-

import sys

def mapper_func():
    for line in sys.stdin:
        if len(line.strip()) > 1:
            print line.strip() + "\t" + "1"

if __name__ == "__main__":
    mapper_func()
