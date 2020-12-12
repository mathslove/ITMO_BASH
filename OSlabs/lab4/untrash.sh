#!bin/bash

[ $# -ne 1 ] && echo "Parametrs required: 1; passed: $#" && exit

file=$1

possible=$(grep $file ~/.trash.log)

touch untrash_queue.tmp
for line in $possible; do
	file_name=$( echo $line | awk -F ":" '{print $1}'| awk -F "/" '{print $NF}')
	if [ "$file" == "$file_name" ]
	then
	echo $line >> untrash_queue.tmp
	fi
done

for line in $(cat untrash_queue.tmp); do
	echo "Do you want to restore this file $(echo $line | awk -F ":" '{print $1}') y/n ?"
	read ans
	if [ "$ans" == "y" ]
	then
		cur_cd=$(echo $line| awk -F: '{print $1}'| awk -F/ -v OFS='/' '{$NF=""; print $0}')
		tr_cd=$(echo $line | awk -F: '{print $2}')
		if [ ! -d "$cur_cd" ]
		then
			cur_cd=~/
		fi
		if [ -f "$cur_cd$file" ]
		then
			echo "You need to rename restored file, because it's already exists"
			while read ans; do
				if [ ! -f $cur_cd$file ]
				then
					echo "Try anther one"
				else
					break
				fi
			done
		fi
		ln $tr_cd $cur_cd$file
		rm $tr_cd
		cat ~/.trash.log | grep -v $tr_cd > ~/.trash.log
	fi
done

rm -f untrash_queue.tmp
