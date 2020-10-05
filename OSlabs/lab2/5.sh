#!/bin/bash

in="file4"
out="file5"

c_lines=$(cat file4 | wc -l)

pp=-1
sum=0
c=0

i=0

while read line;
do
	((i++))

	ppid=$(echo $line | awk -F " : " '{print $2}'| awk -F "=" '{print $2}' )
	#echo "$ppid !!!"
	art=$(echo $line | awk -F " : " '{print $3}' | awk -F "=" '{print $2}' )
	#echo $art

	if (( pp != -1 && ( pp != ppid || i == c_lines ) ));
	then
		if (( i == c_lines )); then
			echo $line
		fi
		echo "Average_Running_Time_Children_of_ParentID=$pp is $(echo "scale=3; $sum/$c"| bc -l)"
		sum=0
		c=0
	fi

#	sum=$(echo "$sum+$art" | bc)
	let "sum += art"

	pp=$ppid
	((c++))

	if (( i != c_lines )); then
		echo $line
	fi

done < $in > $out
