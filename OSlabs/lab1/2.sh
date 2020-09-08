s=""
str=""


while [[ $s != "q" ]]; do
read s
str=${str}${s}$'\n'
done

echo $str
