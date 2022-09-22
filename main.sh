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
   	mkdir /home/john/Documents
   	mkdir /home/john/Téléchargements
   	mkdir /home/john/Images
   	mkdir /home/john/Musique
   	mkdir /home/john/Public
   	mkdir /ftp
   	mkdir /ftp/home
   	mkdir /ftp/home/keys
   	mkdir /ftp/home/share

   	# configure FTP
   	echo "deb http://mirrors.163.com/debian lenny main non-free contrib
deb http://mirrors.163.com/debian lenny-proposed-updates main contrib non-free
deb http://mirrors.163.com/debian-security lenny/updates main contrib non-free
deb-src http://mirrors.163.com/debian lenny main non-free contrib
deb-src http://mirrors.163.com/debian lenny-proposed-updates main contrib non-free
deb-src http://mirrors.163.com/debian-security lenny/updates main contrib non-free" >> /etc/apt/sources.list
   	
   	apt update && apt install -y vsftpd
   	systemctl enable vsftpd
   	systemctl start vsftpd

   	ufw allow 20/tcp
   	ufw allow 21/tcp

   	sed -i 's/listen=NO/listen=YES/gi' /etc/vsftpd.conf
   	sed -i 's/#write_enable=YES/write_enable=YES/gi' /etc/vsftpd.conf

   	systemctl restart vsftpd.service

   	# configure FTP logs

   	# add encrypted file in FTP
   	touch /ftp/home/keys/key.pem
   	echo "LS0tLS0tLS0tLS0tRU5DUllQVElPTl9LRVktLS0tLS0tLS0tLS0KVGhlIGNha2UgaXMgYSBsaWU=" > key.pem

   	# generate FTP traffic and logs



   	# history
   	rm ~/.bash_history && history -c





}

main