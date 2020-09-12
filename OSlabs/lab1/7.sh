#!bin/bash

file="emails.lst"
src="/etc"

reg_email="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b"

grep -rohIE $reg_email $src| tr "\n" ", "  > $file

exit 0
