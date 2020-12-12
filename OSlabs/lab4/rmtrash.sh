#!bin/bash

file="./"$1

[ $# -ne 1 ] && echo "Parameters required: 1; passed: $#" && exit
[ -d $file ] && echo "Given path is a directory" && exit
[ ! -f $file ] && echo "No such file" && exit

trashDIR=~/.trash
[ ! -e $trashDIR ] && mkdir $trashDIR && echo 1 > $trashDIR/count

trashNAME=$trashDIR/$(cat $trashDIR/count)
ln $file $trashNAME || exit
rm -f $file

[ -f ~/.trash.log ] || touch ~/.trash.log
echo $PWD/$1:$trashNAME	>> ~/.trash.log

count=$(cat $trashDIR/count)
let count=$count+1
echo $count > $trashDIR/count
