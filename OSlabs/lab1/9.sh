reg="/var/log/*.log"

c=0

wc -l $reg | awk 'END{print $1}'

exit 0
