bash 4_loop.sh & pid1=$!
bash 4_loop.sh & pid2=$!
bash 4_loop.sh & pid3=$!

renice +7 -p $pid1

echo $pid1 $pid2 $pid3
echo "Bomb has been planted"
echo "kill $pid1 $pid2 $pid3; echo Bomb has been defused" | at now + 1 minutes 2>/dev/null

