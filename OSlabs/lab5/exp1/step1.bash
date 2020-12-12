#!/bin/bash


./mem.bash
bash ../analyzer-sys/analyze.bash start $(cat mem.pid) &
main_pid=$(cat mem.pid)
while true; do
	sleep 2s
	failed=$(dmesg | grep -i "killed process $main_pid")
	if [ -n "$failed" ]
	then
		bash ../analyzer-sys/analyze.bash stop $(cat mem.pid)
		dmesg | tail -n 2
		break
	fi
done &
