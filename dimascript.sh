#!/bin/bash


helper(){

cat<<EOF
	SEE BELOW WHAT ARGUMENTS YOU CAN USE:

 -p  --  look path to file;
 -d  --  look your name;
 -t  --  available MEM
 -------------------------------------------------	
 

EOF

}



logger() {
printf '\e[1;33m%-6s\e[m\n' "$*"
}

error(){

logger "ERROR" $*>&2
 
}


info(){

 logger $*>&1
}


arg_check(){

if [[ -z "$1" ]]; then
	error "insert at least one argument"

fi;

for i in $@
do
	case $i in 
		  "p"|"-p")
		   echo "PATH to file:"	
		   pwd;;
		  "d"|"-d")
		   echo "YOU IS :"
		   whoami;;
		  "t"|"-t")
		  echo "Information about memmory:"	
		   free -m;;          
	          *)
		   error "you cannot use argument $i"	
		   helper ;	
esac
done

}

arg_check $@

