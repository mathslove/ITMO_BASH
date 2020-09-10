#!bin/bash
src="/var/log/anaconda/X.log"
file="full.log"

wrn="\\(WW\\)"
inf="\\(II\\)"

new_wrn="Warning:"
new_inf="Information:"

grep -E -h "$wrn|$inf" $src | sed -E -e "s/$wrn/$new_wrn/" -e "s/$inf/$new_inf/" > $file
