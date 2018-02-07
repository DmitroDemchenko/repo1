#!/bin/bash




error(){

printf '\e[1;33m%-6s\e[m\n' "$*"

}



gethost(){
FILEPATH=$1
IFS=$';'

for i in $(cat ${FILEPATH})
do
	dns=$(host $i | awk '{print $5}')
	for j in $dns
	do
	   echo ${j%%.}
	done 
done


}

gethost $@


echo ${FILEPATH}
