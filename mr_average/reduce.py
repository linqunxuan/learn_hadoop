#!/usr/bin/python

import sys

count = 0
total = 0 
temp_key = None

for line in sys.stdin:
    key, val = line.strip().split('\t')
    new_val = int(val)
    if temp_key == None:
        temp_key = key
    
    if temp_key != key:
        print temp_key + "\t" +str(total/count)
        temp_key = key        
        total = 0
        count = 0

    count += 1
    total += new_val

print temp_key + "\t" + str(total/count)
