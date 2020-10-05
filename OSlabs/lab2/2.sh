#!bin/bash

file="file2"
ps ax --format pid,command | grep "/sbin/"| awk '{print $1}' > $file
