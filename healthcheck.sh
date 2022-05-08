#!/bin/bash 

url="localhost"
status=`curl $url -o /dev/null -w '%{http_code}\n' -s`
if [ $status -eq "200" ]; then
	exit 0
else
	exit 1
fi
