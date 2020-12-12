usr1(){
	rm .pid -f
	exit 1
}

trap 'usr1' USR1
echo $$ > .pid
while true
do
	read line
#	echo $line
	echo "$line" >> pipe5
done
