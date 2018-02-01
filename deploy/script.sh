#!/bin/bash

if [ -d '/app/bin' ]; then
   echo 'directory /app/ bin exist'

else
 sudo mkdir -p  /app/bin;
 echo 'directory /app/ has created'
fi

 if [ -d '/app/bin/version' ]; then
   echo "directory /app/bin/version  alreary ecxist"

  else
     sudo mkdir -p  /app/bin/version;
  echo "directories /app/bin/version created"            
 fi


