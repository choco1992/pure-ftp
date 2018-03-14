#!/bin/bash

user_name="$1" ; 
password="$2" ;
home_directory="/mnt" ;

if test $# lt "2"
then
        echo -e "Warning, this script have to be launch with two argument, please see Help Menu" ; 
  else
        echo "Found  arguments : \n User $1 will have password $2 with default home directory $home_directory" ;

fi


docker exec -it ftpd_server  /opt/useradd.expect $1 $home_directory 


