# curl-https-www-tester
test if your domain has proper https and www rewrites


## usage:
```
user@host:~# chmod +x ./testurls.sh
user@host:~# ./testurls.sh domain.com
testing url http://domain.com
HTTP/1.1 301 Moved Permanently
Location: https://domain.com/

testing url http://www.domain.com
HTTP/1.1 301 Moved Permanently
Location: https://www.domain.com/

testing url https://domain.com
HTTP/1.1 301 Moved Permanently
Location: https://www.domain.com/

testing url https://www.domain.com
HTTP/1.1 200 OK
```
