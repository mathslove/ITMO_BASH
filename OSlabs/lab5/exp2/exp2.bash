#!/bin/bash
n=$1
k=$2

for i in $(seq 1 $k); do
	./newmem.bash $n
done &
