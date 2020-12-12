#!/bin/bash
array=()
loop_c=0
echo report > report.log
while true; do
	array+=(1 2 3 4 5 6 7 8 9 10)
	((loop_c+=1))
	if [ $(($loop_c % 100000)) -eq 0 ]
	then
		echo ${#array[@]} >> report2.log
	fi
done & echo $! > mem2.pid
