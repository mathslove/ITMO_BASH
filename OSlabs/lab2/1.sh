#!bin/bash

f="file1"
ps -u root | wc -l > $f
ps -u root --format pid,command | awk '{print $1":"$2}' >> $f
