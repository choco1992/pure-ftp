#!/bin/bash

PUBLICHOST=$1 ; 

if test -z "$1" 
then
	echo -e "No IP detected as arguement, the server is going to run on local IP  (127.0.0.1) \n"
	PUBLICHOST="127.0.0.1" ; 
  else 
	echo "Found IP $1 , server will run on this IP " 

fi

mkdir -p  /mnt/pure-ftpd/patch  /mnt/pure-ftpd/ftpusers /mnt/pure-ftpd/passwd /mnt/pure-ftpd/ssl/private ;
chown -R root:root /mnt/pure-ftpd/patch ; 
 

/usr/bin/docker run -d --name ftpd_server -p 21:21 -p 30000-30009:30000-30009 -e "PUBLICHOST=$PUBLICHOST"  -v  /mnt/pure-ftpd/ftpusers:/home/ftpusers  -v /mnt/pure-ftpd/passwd:/etc/pure-ftpd/passwd -v /mnt/pure-ftpd/ssl/private:/etc/ssl/private  -v /mnt/pure-ftpd/patch:/mnt  ftp-pozos ; 

