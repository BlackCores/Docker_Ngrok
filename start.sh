#!/bin/bash

cp -r /home/git/ngrok/bin/windows_amd64 /home/softwear
cd /home/git/ngrok
./bin/ngrokd -tlsKey=server.key -tlsCrt=server.crt -domain="$DNS_URL" -httpAddr=":80" -httpsAddr=":443"