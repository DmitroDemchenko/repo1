#!/bin/bash




error(){

printf '\e[1;33m%-6s\e[m\n' "$*"

}



gethost(){

if [[ -z "$(<$1)" ]]; then
	error "file is empty"

else

param="$(<$1)"

for i in $param
do
	host $i | awk '{print $5}' | sed 's/^\(.*\).$/\1/'
done

fi;

}

gethost $@
