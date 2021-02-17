!#/bin/bash

#This is place holder text 
# Will add something here that begins out tor service
# and update our proxychains config file
# with fresh proxies
		#Grab a fresh proxy list from github For Socks4 Proxies
		curl 'https://raw.githubusercontent.com/TheSpeedX/SOCKS-List/master/socks4.txt' -o laundrybag --silent ; 
		echo "$(tail -n +2 laundrybag)" > laundrybag  #Cutting out Comments

		# Grab 100 Hosts from the laundrybag and save them to dirtySOCKS 
		shuf -n 100 laundrybag | tee dirtySOCKS

		# Format dirtySOCKS for the hidemy.name/api to check
		fmtSOCKS=$(sed -e ':a' -e 'N' -e '$!ba' -e 's/:/%3A/g' -e 's/\n/%0A/g' dirtySOCKS)

		# Passing out data to hidemy.name/api and taking the group id to pull the response txt with 
		# an active clients
		checkedSOCKSGroup=$(curl -d "data=$fmtSOCKS" -X POST 'https://hidemy.name/api/checker.php?out=js&action=list_new&tasks=socks4&parser=lines' --silent | sed -e 's/^.*:/ /g' -e 's|[}]||g')
		
		# Grab file of responsive proxies from Hideme.name/api
		curl "https://hidemy.name/api/checker.php?out=plain&action=export&working&groups=$checkedSOCKSGroup" -o cleanlaudry --silent

		#Format proxies for ProxyChains.conf 