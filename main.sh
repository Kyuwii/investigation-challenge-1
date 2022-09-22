#!/bin/bash

set -e 


main()
{
	#set users
	john-pass = "dvH01"
	mike-pass = "typR4"
	pierre-pass = "vGbR1"

   	useradd john -m -s /bin/bash 2>/dev/null
   	echo "john:$john-pass" | chpasswd

   	useradd mike -m -s /bin/bash 2>/dev/null
   	echo "mike:$mike-pass" | chpasswd

   	useradd john -m -s /bin/bash 2>/dev/null
   	echo "pierre:$pierre-pass" | chpasswd



}

main