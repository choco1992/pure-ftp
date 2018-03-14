#!/bin/bash

user_name="$1" ; 
password="$2" ;
home_directory="/mnt" ;

if test $# lt "2"
then
        echo -e "Warning, this script have to be launch with two argument, please see Help Menu" ; 
  else
        echo "Found  arguments : \n User $user_name will have password $password with default home directory $home_directory" ;

fi


docker exec -d ftpd_server  /opt/useradd.expect $user_name $password $home_directory  
#docker exec -it ftpd_server  /opt/useradd.expect $user_name $password $home_directory  


