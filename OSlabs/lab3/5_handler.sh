mode="+"
res=1

tail -f pipe5 |
while true
do
	pid=$!
	echo $pid
	read line
#	echo $line
	case $line in
		"+")
			mode="+"
			echo "Плюс в чат если любишь маму"
			;;
		"*")
			mode="*"
			echo "Звезду надо отмыть, но потом"
			;;
		QUIT)
			echo "*Встал и вышел*"
			kill -USR1 $(cat .pid)
			kill $pid
			exit 0
			;;

		[0-9]*)
			case $mode in
				"+")
					res=$(($res + $line))
					echo Result: $res
					;;
				"*")
					res=$(($res * $line))
					echo Result: $res
					;;
			esac
			;;
		*)
			echo "я не такой умный"
			echo "всё, пока"
			kill -USR1 $(cat .pid)
			kill $pid
			exit 1
			;;
	esac

done & 2>/dev/null
