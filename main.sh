#!/bin/bash

set -e 


main()
{
	# set users
	john-pass = "dvH01"
	mike-pass = "typR4"
	pierre-pass = "vGbR1"
	ftp-pass = "3rftI"

   	useradd john -m -s /bin/bash 2>/dev/null
   	echo "john:$john-pass" | chpasswd

   	useradd mike -m -s /bin/bash 2>/dev/null
   	echo "mike:$mike-pass" | chpasswd

   	useradd pierre -m -s /bin/bash 2>/dev/null
   	echo "pierre:$pierre-pass" | chpasswd

   	useradd ftp -m -d /var/ftp/home/ -s /bin/bash 2>/dev/null
   	echo "ftp:$ftp-pass" | chpasswd

   	# configure FTP
   	apt update && apt install -y vsftpd
   	systemctl start vsftpd
   	ufw allow 20/tcp
   	ufw allow 21/tcp

   	sed -i 's/listen=NO/listen=YES/gi' /etc/vsftpd.conf
   	sed -i 's/#write_enable=YES/write_enable=YES/gi' /etc/vsftpd.conf

   	systemctl restart vsftpd.service

   	# configure FTP logs

   	# add encrypted file in FTP
   	touch secret.txt
   	echo "test" > secret.txt

   	# generate FTP traffic and logs



   	# history
   	rm ~/.bash_history && history -c





}

main