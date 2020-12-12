#!/bin/bash
file=mem.info
cat /proc/meminfo | grep -i memtotal > $file
cat /proc/meminfo | grep -i swaptotal >> $file
page_s=$(getconf PAGE_SIZE)
echo -e "PageSize:\t\t\b$(echo $page_s/1024 | bc) kB" >> $file
cat /proc/meminfo | grep -i memfree >> $file
cat /proc/meminfo | grep -i swapfree >> $file
