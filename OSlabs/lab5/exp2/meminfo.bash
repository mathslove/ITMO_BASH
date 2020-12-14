#!/bin/bash

case "$1" in
	"start")
		echo > mem.info
		while true; do
			top -b -n 1 | head -n 6 >> mem.info
			sleep 1s
		done & echo $! > mem.pid
		;;
	"stop")
		kill $(cat mem.pid)
		;;
esac
