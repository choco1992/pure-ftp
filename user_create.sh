#!/bin/bash

user_name="$1" ; 
password="$2" ;
home_directory="/mnt/upload" ;

if (( "$#" < "2" ))
then
        echo -e "\033[31mERROR\033[0m, Minimum 2 arguments mandatories for this command,  \nFirst argument = user name \nSecond argument = password \n\nPlease refer to Help Menu" ; 
	exit "1" ; 
  else
        echo -e "Found  arguments : \nUser \033[32m$user_name \033[0mwill be created with default home directory \033[32m$home_directory\033[0m" ;

fi


/usr/bin/docker exec -d ftpd_server add_ftp_user  $user_name $password $home_directory 



