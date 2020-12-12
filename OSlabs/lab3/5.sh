mkfifo pipe5

bash ./5_handler.sh
bash ./5_gen.sh
#bash ./5_handler.sh

rm pipe5 -f
