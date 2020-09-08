#Let a=21+22+21+18+23+21+20+21+23+14+20+22
echo $HOME
file="file.txt"
echo > $file
i=0
while [[ $i -le 3 ]];
do
echo $i >>  $file
i=$[ $i + 1 ]
done
