if [[ $PWD == $HOME ]]; then
echo $HOME
exit 0
else
echo "You are not in HOME dir, sucker!"
exit 1
fi
