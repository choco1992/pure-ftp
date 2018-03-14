#!/bin/bash

PUBLICHOST=$1 ; 

if test -z "$1" 
then
	echo -e "\033[33mWARNING : \033[0m No IP detected as arguement, the server is going to run on localhost IP  \033[32m(127.0.0.1) \033[0m \n"
	PUBLICHOST="127.0.0.1" ; 
  else 
	echo -e "Found IP \033[32m $1 \033[0m, server will run on this IP " 

fi


#Setting folder where we will mount docker volumes to store pacths, password file, and eventually another files.
mkdir -p  /mnt/pure-ftpd/patch  /mnt/pure-ftpd/ftpusers /mnt/pure-ftpd/passwd /mnt/pure-ftpd/ssl/private ;
chown -R root:root /mnt/pure-ftpd/patch ; 
 

/usr/bin/docker run -d --name ftpd_server -p 21:21 -p 30000-30199:30000-30199 -e "PUBLICHOST=$PUBLICHOST"  -v  /mnt/pure-ftpd/ftpusers:/home/ftpusers  -v /mnt/pure-ftpd/passwd:/etc/pure-ftpd/passwd -v /mnt/pure-ftpd/ssl/private:/etc/ssl/private  -v /mnt/pure-ftpd/patch:/mnt/upload  ftp-pozos ; 

