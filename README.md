# fresh-socks4.sh
> Collects IPS enumatrated by https://github.com/TheSpeedX/PROXY-List
> 
> Sends the maximum number of 100 random addresses from that list to https://hidemy.name/api
> 
> Requests Lists of Reponsive addreses back from https://hidemy.nam/api
> 
> Formats List for Proxychains.conf file ie. {protocol address port}

# Quick Warnings 
> This Jawn is slow, takes a full 1.8 minute sleep for the API to finish checking the IP addrs 
> 
> DO NOT RUN THIS SCRIPT WITHOUT READING THE CODE IT WILL MORE THAN LIKELY DESTROY YOUR PROXYCHAINS.CONF 
> PERSONALIZE THE SED EDIT FOR YOUR NEEDS 

# To Do List 
> Add Usage Arguemnts & Verbose Mode
>
> Check to see if tor service is enabled 
>
> Regex to find the end of the /etc/proxychains.conf & append from there
> 
> Find a faster way to check hosts for aliveness, maybe smaller payloads distributed to more apis ?
>
> Do it in C  ? 
> 
 # License 

 MIT License

Copyright (c) 2021 Prisscillia

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

