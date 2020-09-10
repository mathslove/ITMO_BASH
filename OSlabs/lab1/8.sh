#!bin/bash

src="/etc/passwd"

awk -F ":" '{print $1": " $3}' $src | sort -nk 1

exit 0
