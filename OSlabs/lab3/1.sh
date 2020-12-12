#!/bin/bash

newdir=~/test
newfile=$newdir"/"$(date +"%F_%T")

site=www.net_nikogo.ru

report=~/report
mes_suc="catalog test was created successfully"
mes_war=$(date +"%F %T")" connection failed"

mkdir $newdir 2>/dev/null && {
		echo $mes_suc > $report
		touch $newfile
	}

ping -c 1 $site 2>/dev/null || echo $mes_war >> $report
