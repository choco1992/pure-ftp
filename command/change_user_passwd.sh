#!/bin/bash



if (( "$#" < "1" ))
then
        echo -e "\033[33mWARNING\033[0m, Changing users command need at least one arguments, an ftp user" ; 
	exit "1" ; 
  else
	user_name="$1" ; 
        echo -e "\033[32mFound  arguments\033[0m, Password of user $user_name will be changed ";
	echo -e "Please enter the password for user \033[32m$user_name\033[0m"
                        read -p "Password : " -s password ;
                        echo "Please confirm the password"
                        read -p "Password : " -s password2 ;

                        if [ "$password" != "$password2" ]
                        then
                                echo -e "\033[31mError\033[0m : First password is different from second" ;
                                exit 1 ;
                        fi


	/usr/bin/docker exec -d ftpd_server change_user_passwd  $user_name $password ; 

fi


