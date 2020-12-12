pid=$(cat .pid)

while true
do
	read line

	case $line in
		"+")
			kill -USR1 $pid
			;;
		"*")
			kill -USR2 $pid
			;;
		"TERM")
			echo ШАХ
			kill -SIGTERM $pid
			sleep 3s
			exit 0
			;;
		*)
			:
			;;
	esac

done
