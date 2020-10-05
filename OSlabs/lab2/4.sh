#!/bin/bash

out="file4"

for pid in $(ps ax --format pid)
do
	status="/proc/"$pid"/status"
	sched="/proc/"$pid"/sched"

	ppid=$(grep -Esh "PPid" $status | awk '{print $2}')
	SumRT=$(grep -Esh "se.sum_exec_runtime" $sched|
					awk '{print $3}'|
					awk -F "." '{print $2}')
	nrt=$(grep -Esh "nr_switches" $sched | awk '{print $3}')

	if [[ -n $ppid ]]
	then
		art=$(echo "$SumRT/$nrt" | bc)
		echo "ProcessID=$pid : Parent_ProcessID=$ppid : Avereage_Running_Time=$art "
	fi
done | sort -n -t "=" -k3 > $out
