#!/bin/bash
 
if [ "$EUID" -ne 0 ]
  then echo "Please Run as Root"
 exit
fi

# Creating our file system so bash doesn't yell at us 
if [ ! -d "./sockpile" ]
	then mkdir sockpile
fi

checkedsocks=./sockpile/checkedsocks
dirtysocks=./sockpile/dirtysocks
laundrybag=./sockpile/laundrybag
cleansocks=./sockpile/cleansocks

if [[ ! -e $cleansocks ]]; then
	touch $cleansocks
fi

if [[ ! -e $checkedsocks ]]; then
	touch $checkedsocks
fi

if [[ ! -e $dirtysocks ]]; then
	touch $dirtysocks
fi

if [[ ! -e $laundrybag ]]; then
	touch $laundrybag
fi

#	Grab a fresh Socks4 proxy list from TheSpeedX's Github
		curl 'https://raw.githubusercontent.com/TheSpeedX/SOCKS-List/master/socks4.txt' -o $laundrybag --silent ; 
		sed -i -e 1,2d $laundrybag #Cutting out Comment

#	Grab 100 Hosts from the laundrybag and save them to dirtysocks
		shuf -n 100 $laundrybag | sed -e ':a' -e 'N' -e '$!ba' -e 's/:/%3A/g' -e 's/\n/%0A/g' > $dirtysocks #Format dirtysocks for the hidemy.name/api to check

#	Passing out data to hidemy.name/api
		curl -d "data=$(cat $dirtysocks)" -X POST 'https://hidemy.name/api/checker.php?out=js&action=list_new&tasks=socks4&parser=lines' --silent | sed -e 's/^.*:/ /g' -e 's|[}]||g' | tr -d " " | tee $checkedsocks

sleep 1.8m
#	Grab file of responsive proxies from Hideme.name/api
		wget -O $cleansocks "https://hidemy.name/api/checker.php?out=plain&action=export&working&groups=$(cat $checkedsocks)"
#	Format proxies for ProxyChains.conf 
		sed -i -e 's/^/socks4 /' -e 's/:/ /' $cleansocks

# W4rn1ng this is a personal configuration for MY BOX 
sed -i 116q /etc/proxychains4.conf 
cat cleansocks >> /etc/proxychains4.conf
