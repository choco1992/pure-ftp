#!/bin/bash

if (( "$#" < "2" ))
then
        echo -e "\033[33mWARNING\033[0m, Changing users command need at least two arguments,\n\nPlease see Help Menu" ; 
	exit "1" ; 
  else
        echo -e "\033[32mFound  arguments\033[0m, Password will be changed";
	user_name="$1" ; 
	passwd="$2" ; 
	/usr/bin/docker exec -d ftpd_server change_user_passwd  $user_name $passwd ; 

fi





