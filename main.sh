#!/bin/bash

set -e 


main()
{
	# set users
	johnPass="dvH01"
	mikePass="typR4"
	pierrePass="vGbR1"

   	useradd john -m -s /bin/bash 2>/dev/null
   	echo "john:$johnPass" | chpasswd

   	useradd mike -m -s /bin/bash 2>/dev/null
   	echo "mike:$mikePass" | chpasswd

   	useradd pierre -m -s /bin/bash 2>/dev/null
   	echo "pierre:$pierrePass" | chpasswd



   advpath="/usr/share/.linux-adventures/"   
   mkdir -p $advpath.exercises 2> /dev/null
   mkdir -p $advpath.exercises/dir-{1..3} 2> /dev/null
   mkdir -p $advpath.ascii 2> /dev/null
   mkdir -p $advpath.cron 2> /dev/null
   	# configure FTP logs

	Dpath="/usr/share/"

    # create file & directory for john
    mkdir -p $Dpath.Documents 2> /dev/null
    mkdir -p $Dpath.Factures 2> /dev/null
    mkdir -p $Dpath.GitHub 2> /dev/null
    mkdir -p $Dpath.Private 2> /dev/null
    mkdir -p $Dpath.Public 2> /dev/null
    mkdir -p $Dpath.Keys 2> /dev/null

    mkdir -p /home/john/Keys 2> /dev/null


}

main