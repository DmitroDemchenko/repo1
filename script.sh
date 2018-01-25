#!/bin/bash


#helper function
helper() {
    cat <<EOF
Script for orchestration ssh sessions to remote hosts

        -f|--file <path to file>  source file with hosts
        -d|--dry-run              doesn't apply changes, just show what would be done
        -h|--help                 print helper message
EOF
}


#logger function
logger() {
printf '\e[1;33m%-6s\e[m\n' "$*"
}

#error message function
error() {
logger "ERROR: $*" >&2
}

#exit function
exiter(){
helper >&2; error "$*"; exit 1
}

#function to check arguments passed to script
arguments_checker() {

#if no args given print helper and exit
if [[ "$#" == 0 ]]; then
    exiter "Must specify at least one argument"
fi

while [ "$#" -gt 0 ]; do
    param=$1
    case $1 in
        #parse arguments set in var=value format, used variable expansion:
        #https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
        --*'='*) shift; set -- "${param%%=*}" "${param#*=}" "$@"; continue
            ;;
        -f|--file) shift; FILE_PATH="$1"
            ;;
        -d|--dry-run) DRY_RUN=1
            ;;
        -h|--help) helper; exit 0
            ;;
        -*) exiter "unknown option: $1"
            ;;
        *) break
            ;;
     esac
     shift || exiter "${param} argument requires value"
done
#check that value not missed
if [[ -z "$FILE_PATH" ]];
then
exiter "-f <file path> missed"
fi

}

arguments_checker "$@"

#check if dry run set
if [[ -n $DRY_RUN ]]
then
    dry="echo dry_run: "
fi

#main functionality
# complete rest of the issues

$dry uptime

$dry uname -a

