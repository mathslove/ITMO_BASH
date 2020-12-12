#!/bin/bash
n=$1
array=()
arr_s=0
echo report > report.log
while true; do
	array+=(1 2 3 4 5 6 7 8 9 10)
	((loop_c+=10))
	if [ $arr_s -gt n ]
	then
		echo ${#array[@]} >> report.log
		break
	fi
done & echo $!
