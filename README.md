# fresh-socks4
A small shell script to automate the gathering of proxy servers.

# Quick Warnings 
> This Jawn is slow, takes a full 1.8 minute sleep for the API to finish checking the IP addrs 
>
>

# fresh-socks4.sh
> Collects IPS enumatrated by https://github.com/TheSpeedX/PROXY-List
> 
> Sends the maximum number of 100 random addresses from that list via curl post request to https://hidemy.name/api
> 
> Requests Lists of Reponsive addreses back from https://hidemy.nam/api
> 
> Formats List for Proxychains.conf file ie. {protocol address port}

# There are fun and easy options to customize this script that I would encourage 
 > Trimming your proxychains.conf of old proxies
 > 
 > Automatically adding new proxies into your file
