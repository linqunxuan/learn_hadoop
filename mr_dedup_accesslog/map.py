#!/usr/bin/python
# -*- coding:utf-8 -*-

import sys
import re

def isValidIp(ip):
    ipm = re.match(r'^([1-9]?\d|1\d\d|2[0-4]\d|25[0-5])\.([1-9]?\d|1\d\d|2[0-4]\d|25[0-5])\.([1-9]?\d|1\d\d|2[0-4]\d|25[0-5])\.([1-9]?\d|1\d\d|2[0-4]\d|25[0-5])$',ip)
    if ipm != None:
        return True
    else:
        return False

def mapper_func():
    for line in sys.stdin:
        str_list = line.strip().split(' ')
        ip = ("".join(str_list[-1:])).replace("\"", "")
        if isValidIp(ip) == True:
            print ip + "\t" + "1"

if __name__ == "__main__":
    mapper_func()
