#!/bin/bash

template="rchar"

find /proc -maxdepth 2 -name "io" -type f -exec grep -isH $template {} \; | sort -n -k2 > tmp1.my

sleep 1m

find /proc -maxdepth 2 -name "io" -type f -exec grep -isH $template {} \; | sort -n -k2 > tmp2.my

touch tmp3.my
while read line; do

	pid=$(echo $line | awk -F "/" '{print $3}' )
	bytes1=$(echo $line | awk '{print $2}')
	bytes2=$(grep -s "/$pid/" tmp2.my | awk '{print $2}')
	if [[ $bytes2 ]]; then

		diff=$(echo " $bytes2-$bytes1"| bc)
		#echo $bytes2 $bytes1 $diff
		echo $pid $diff >> tmp3.my
	fi

done < tmp1.my
cat tmp3.my | sort -n -k2 | tail -n 3 | awk '{print "PID="$1" Difference="$2}'
rm -f *.my
