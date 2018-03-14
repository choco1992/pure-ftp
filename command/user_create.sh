#!/bin/bash

. function.sh

# Parsing options
optspec=":-:"
while getopts "$optspec" optchar; do
	case "${OPTARG}" in
		"username" | "u")
			user_name="${!OPTIND}" ;
			OPTIND=$(( $OPTIND + 1 )) ; 
	
		;;

		"password" | "p")
			password="${!OPTIND}" ;
			OPTIND=$(( $OPTIND + 1 )) ;
	
		;;

		"home_directory"  | "d")
			home_directory="${!OPTIND}" ;
			OPTIND=$(( $OPTIND + 1 )) ;
		;;

		"help" | "h")
			user_create_help_menu ;
			exit 1	
		;;
	
		*)
			user_create_help_menu ; 
			exit 1	
		;;
	
	
	esac
done


#Checking user name and password  options

        if test -z "$user_name"
          then
                echo -e "\033[33mError : Missing Options!\033[0m, Please see Help Menu \n << --help >>  << -h >> options " ;
                exit 1 ;
        else
                if test -z "$password"
                  then
                        echo -e "Please enter the password for user \033[32m$user_name\033[0m"
                        read -s password ;
                        echo "Please confirm the password"
                        read -s password2 ;
                        
			if [ "$password" != "$password2" ]
                        then
                                echo -e "\033[31mError\033[0m : First password is different from second" ;
                                exit 1 ;
                        fi

                fi
        fi

#Checking home directory option
if test -z "$home_directory"
  then
	home_directory="/mnt/upload";
        echo -e "You did not setted -d option, home directory will be set to default directory \033[32m$home_directory \033[0m" ;
else
        echo -e "Creating user  \033[32m$user_name \033[0m..." ;

fi

#Sending options to docker container to create user and password
/usr/bin/docker exec -d ftpd_server add_ftp_user  $user_name $password $home_directory ;

exit  0 ;

