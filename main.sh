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