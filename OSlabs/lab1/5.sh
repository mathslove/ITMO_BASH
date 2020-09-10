file="info.log"

source="/var/log/anaconda/syslog"

cat $source | awk '$2 = "INFO"'>$file

exit 0
