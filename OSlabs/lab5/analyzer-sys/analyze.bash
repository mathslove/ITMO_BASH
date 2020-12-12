#!/bin/bash
cmd=$1
pid=$2
droot=~/workspace/OSlabs/lab5/analyzer-sys/
case "$cmd" in
	"start" )
		bash $droot"analyzer-start.bash" $pid $3 & pid=$!
		
		;;
	"stop" )
		kill $(cat $droot"analyzer.pid")
		;;
	"clean" )
		bash $droot"analyzer-clean.bash"
		;;
	* )
		echo No such option
		;;
esac
