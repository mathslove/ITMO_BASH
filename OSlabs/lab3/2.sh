#!bin/bash

at now + 2 minutes -f ./1.sh 2>/dev/null

tail -f ~/report -n 0&

