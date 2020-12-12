#!/bin/bash

./mem.bash
./mem2.bash
bash ../analyzer-sys/analyze.bash start $(cat mem2.pid) $(cat mem.pid) &

pid1=$(cat mem.pid)
pid2=$(cat mem2.pid)

i=0
j=0
while true;
do
	sleep 2s

	m1=$(dmesg | grep -i "killed process $pid1")
	if [ -n "$m1" ]; then
		i=1
	fi

	m2=$(dmesg | grep -i "killed process $pid2")
	if [ -n "$m2" ]; then
		j=1
	fi

	if [ "$j" -eq "1" -a "$i" -eq "1" ]; then
		bash ../analyzer-sys/analyze.bash stop
		break
	fi
done &
