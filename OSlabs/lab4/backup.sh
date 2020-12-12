#!bin/bash
from=~/backup/
source=~/source/
report=$from"backup-report"
[ ! -f $report ] && touch $report

lastDate=$(ls $from | grep -E "^Backup-" | sort -n | tail -1| cut -d "-" -f 2-4)
currentDate=$(date +%Y-%m-%d)
[ -z $lastDate ] && lastDate=0 || lastDate=$(date -d "$lastDate" +%s)

currentDate=$(date -d "$currentDate" +%s)
let dateDiff=($currentDate-$lastDate)/60/60/24

currentDate=$(date -d@$currentDate +%F)
lastDate=$(date -d@$lastDate +%F)

if [[ $dateDiff -gt 7 ]]
then
	mkdir $from"Backup-$currentDate"
	fileList=$(ls $source)
	#echo $fileList
	cp -r $source* $from"Backup-$currentDate"
	echo "New Backup was created in $from with name Backup-$currentDate">>$report
	echo "Coppyed files: $fileList">>$report
else
	fileList=$(ls $source)

	for file in $fileList; do
		if [ -f $file ]
		then
			source_s=$(ls -l $source"$file"| awk '{print$5}')
			saved_s=$(ls -l $from"Backup-$currentDate"$file | awk '{print$5}')
			if [[ $source_s -ne $saved_s ]]
			then
				mv $file $file-$lastDate
				cp -R $source"$file" $from/"Backup-$currentDate"
				echo "$file was renamed to $file-$lastDate">>$report
			fi
		else
			cp -R $source"$file" $from/"Backup-$currentDate"
		fi
	done
fi
