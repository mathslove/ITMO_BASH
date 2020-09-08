
if [[ $1 -lt $2 ]]; then
 m=$2
else
 m=$1
fi

if [[ $m -lt $3 ]]; then
 m=$3
fi

echo $m
