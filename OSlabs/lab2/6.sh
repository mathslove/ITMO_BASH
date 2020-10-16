#!/bin/bash



mem_total=$(grep -E "MemTotal" "/proc/meminfo" | awk '{print $2}')

procinfo=$(find /proc -maxdepth 2 -name "status" -exec grep -H "VmRSS" {} \; |
							sort -n -t ":" -k3 | tail -n 1 )
#echo $procinfo
procid=$(echo $procinfo| awk -F "/" '{print $3}')
procmem=$(echo $procinfo | awk '{print $2}')
echo ProcessID=$procid ProcMem=$(echo "scale=2; $procmem/$mem_total*100"| bc -l)
