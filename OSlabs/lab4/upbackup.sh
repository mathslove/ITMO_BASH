#!bin/bash
from=~/backup/
to=~/restore/
[ ! -d $to ] && mkdir $to

lastDate=$(ls $from | grep -E "^Backup-" | sort -n | tail -1| cut -d "-" -f 2-4)
backup=$from"Backup-"$lastDate/
fileList=$(ls $backup)

for file in $fileList; do
	outdated=$(echo $file | grep -E "[0-9]{4}[0-9]{2}[0-9]{2}")
	if [ "$file" != "$outdated" ]
	then
		cp -r $backup$file $to
	fi
done
