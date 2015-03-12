#!/bin/bash
#USE: ./lbsslv2.sh <path to crt files>
#This pulls in all the names of the crt files at the path and creates netscaler certkey configs.
#Example: ./lbsslv2.sh /home/username/SSL/. or ./lbsslv2.sh folder/.
#
#version:2.0
#date   :20150312

/bin/ls -1 $1/*.crt | sed -e "s/.crt$//" |  sed -e "s/^.*\///" | while read SITE

do
	echo add ssl certKey $SITE -cert \"/nsconfig/ssl/sites/$SITE.crt\" -key \"/nsconfig/ssl/sites/$SITE.key\" -expiryMonitor ENABLED
	echo link ssl certKey $SITE DigiCertCA2028
done

