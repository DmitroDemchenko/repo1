#!/bin/bash

## HELP ARGUMENT


args=("$@")

for i in $@
do
if [[ $i == "-h" ]]; then
    echo "-- help_info"
elif [[ $i == "-d" ]]; then
    echo "--dry_run"
else echo $i "is not exist"
	
fi
done
