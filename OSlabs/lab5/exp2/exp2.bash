#!/bin/bash
n=$1
k=$2

for (( i=0; i <= $k; i++ )); do
	sleep 1s
	./newmem.bash $n
done &
