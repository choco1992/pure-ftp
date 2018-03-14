#!/bin/bash

if (( "$#" < "1" ))
then
        echo -e "\033[33mWARNING\033[0m, Deleting users command need at least one argument,\n\nPlease see Help Menu" ; 
	exit "1" ; 
  else
        echo -e "\033[32mFound  arguments\033[0m, all users will be deleted but their respectively home directory will be saved";
	for user_name in $*
	 do
		echo -e "Deleting user \033[32m$user_name\033[0m" ;
		sleep 2 ;
		/usr/bin/docker exec -d ftpd_server delete_ftp_user  $user_name ; 
	done

fi





