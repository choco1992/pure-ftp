#!/bin/bash

user_name="$1" ; 
password="$2" ;
home_directory="/mnt/upload" ;

if (( "$#" < "2" ))
then
        echo -e "Warning, this script have to be launch with two argument, please see Help Menu \n First argument = user_name \n password = password" ; 
	exit "1" ; 
  else
        echo -e "Found  arguments : \n User $user_name will have password $password with default home directory $home_directory" ;

fi


/usr/bin/docker exec -d ftpd_server add_ftp_user  $user_name $password $home_directory 

# /opt/useradd.expect $user_name $password $home_directory  
#docker exec -it ftpd_server  /opt/useradd.expect $user_name $password $home_directory  


