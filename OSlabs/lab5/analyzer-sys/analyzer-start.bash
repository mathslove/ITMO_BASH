#!/bin/bash
droot=~/workspace/OSlabs/lab5/analyzer-sys/
pid=$1
file=$(date "+%F-%H-%M-%S")".top"
touch $file
while true; do
	if [ -n "$2" ]; then
		top -p $1 -p $2 -b -n 1 >> $file
	else
		top -p $pid -b -n 1 >> $file
	fi
	echo -e "------" >>$file
	sleep 1s
done & echo $! > $droot"analyzer.pid"
