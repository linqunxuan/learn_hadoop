#!/usr/bin/python
# -*- coding:utf-8 -*-

import sys
ip_convert = lambda x:sum([256**j*int(i) for j,i in enumerate(x.split('.')[::-1])])

def load_ip_lib_func(ip_lib_fd):
    ip_lib_list = []
    file_in = open(ip_lib_fd, 'r')
    for line in file_in:
        ss = line.strip().split(' ')
        if len(ss) != 5:
            continue
        start_ip = ss[0].strip()
        end_ip = ss[1].strip()
        area = ss[2].strip()
        country = ss[3].strip()
        province = ss[4].strip()
        
        ip_lib_list.append((ip_convert(start_ip), ip_convert(end_ip), area, country, province ))
    return ip_lib_list

def get_addr(ip_lib_list, ip_str):
    user_addr = "henan"
    
    val = ip_convert(ip_str)
    
    start = 0
    mid = 0
    end = len(ip_lib_list) - 1

    while (start <= end):
        mid = (start + end) / 2
        data = ip_lib_list[mid]
        
        start_ip = data[0]
        end_ip = data[1]
        provice = data[4]

        if val < start_ip:
            end = mid - 1
        elif val > start_ip:
            start = mid + 1
    
    if val < start_ip:
        user_addr = ip_lib_list[mid - 1][4]
    else:
        user_addr = ip_lib_list[mid][4]
    return user_addr

def mapper_func(ip_lib_fd):
    ip_lib_list = load_ip_lib_func(ip_lib_fd)

    for line in sys.stdin:
        ss = line.strip().split('\t')
        if len(ss) != 3:
            continue
        
        cookie = ss[0].strip()
        query = ss[1].strip()
        ip_str = ss[2].strip()
        user_addr = get_addr(ip_lib_list, ip_str)

        print "\t".join([cookie, query, ip_str, user_addr])

if __name__ == "__main__":
    module = sys.modules[__name__]
    func = getattr(module, sys.argv[1])
    args = None
    if len(sys.argv) > 1:
        args = sys.argv[2:]
    func(*args)
