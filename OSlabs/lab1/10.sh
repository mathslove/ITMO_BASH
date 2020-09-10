#!bin/bash

man bash |
tr -s '[:punct:]|[:space:]' '\n' |
sort | uniq -c | sort -n -r |
awk '{if (length($2) >= 4) print $2}' | head -3

exit 0
