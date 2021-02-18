# fresh-socks4
A small shell script to automate the gathering of proxy servers.

# Quick Warnings 
Still in developemnt
Anonmymity is only guarenteed by your knowledge and actions
This code is for educational purposes only.

# fresh-socks4.sh
> Collects IPS enumatrated by https://github.com/TheSpeedX/PROXY-List
> Sends the maximum number of 100 random addresses from that list via curl request to https://hidemy.name/api
> Requests Lists of Reponsive addreses back from https://hidemy.nam/api
> Formats List for Proxychains.conf file ie. {protocol address port}

# There are fun and easy options to customize this script that I would encourage 
 > Trimming your proxychains.conf of old proxies
 > Automatically adding new proxies into your file