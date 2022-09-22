#!/bin/bash

set -e 


main()
{
	# set users
	johnPass="dvH01"
	mikePass="typR4"
	pierrePass="vGbR1"
	ftpPass="3rftI"

   	useradd john -m -s /bin/bash 2>/dev/null
   	echo "john:$johnPass" | chpasswd

   	useradd mike -m -s /bin/bash 2>/dev/null
   	echo "mike:$mikePass" | chpasswd

   	useradd pierre -m -s /bin/bash 2>/dev/null
   	echo "pierre:$pierrePass" | chpasswd

   	useradd ftp -m -d /var/ftp/home/ -s /bin/bash 2>/dev/null
   	echo "ftp:$ftpPass" | chpasswd

   	# create file & directory for john
   	mkdir -p /home/john/Documents 2> /dev/null 
   	mkdir -p /home/john/Telechargements 2> /dev/null 
   	mkdir -p /home/john/Images 2> /dev/null 
   	mkdir -p /home/john/Musique 2> /dev/null 
   	mkdir -p /home/john/Public 2> /dev/null 
   	mkdir -p /ftp 2> /dev/null 
   	mkdir -p /ftp/home 2> /dev/null 
   	mkdir -p /ftp/home/keys 2> /dev/null 
   	mkdir -p /ftp/home/share 2> /dev/null 


   	# configure FTP logs

   	# add encrypted file in FTP
   	touch /ftp/home/keys/key.pem
   	echo "LS0tLS0tLS0tLS0tRU5DUllQVElPTl9LRVktLS0tLS0tLS0tLS0KVGhlIGNha2UgaXMgYSBsaWU=" > key.pem

   	# generate FTP traffic and logs



   	# history
   	rm ~/.bash_history && history -c

   	# generate user history
   	runuser -l  john -c 'pwd'
   	runuser -l  john -c 'ls -alt'
   	runuser -l  john -c 'mkdir /home/john/Documents/.spy'
   	runuser -l  john -c 'touch /home/john/Documents/.spy/spy.sh'
   	runuser -l  john -c 'chmod +x /home/john/Documents/.spy/spy.sh'


}

main