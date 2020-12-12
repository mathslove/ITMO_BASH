res=1
mode="+"

plus(){
	mode="+"
}

mult(){
	mode="*"
}

term(){
	echo МАТ
	rm .pid -f
	exit 0
}

echo $$ > .pid
trap 'plus mode' USR1
trap 'mult mode' USR2
trap 'term' SIGTERM

while true
do

	case $mode in
		"+")
			res=$(($res + 2))
			;;
		"*")
			res=$(($res * 2))
			;;
	esac

	sleep 3s

	echo "Result:" $res

done

