#!/bin/bash

echo "I'll be doing bootstrap for adserver"

function check_internet() {
  retry_frequency=$1
  for i in $(seq 1 $retry_frequency); do
    if ping -c 1 -w 1 google.com >> /dev/null 2>&1; then
      echo "Internet is up, can proceed further now"
      return
    else
      echo "Internet connection timeout, continuing with check..."
    fi
  done
}

function install_nginx() {
  apt-get -y update
  apt-get -y install nginx
}

function addHost() {
  HOSTNAME=$1
  PORT=$2
cat >/etc/nginx/sites-available/$HOSTNAME <<ENDOFCONTENT
  upstream swarmcluster$HOSTNAME {
    server swarm-node-1.test.sandy.com:$PORT;
    server swarm-node-2.test.sandy.com:$PORT;
    server swarm-node-3.test.sandy.com:$PORT;
  }
  server {
    listen *:80;
    server_name           $HOSTNAME;
    access_log            /var/log/nginx/$HOSTNAME.access.log combined;
    error_log             /var/log/nginx/$HOSTNAME.error.log;
    location / {
        proxy_pass http://swarmcluster$HOSTNAME;
    }
  }
ENDOFCONTENT
  ln -s /etc/nginx/sites-available/$HOSTNAME /etc/nginx/sites-enabled/
}

check_internet
install_nginx
addHost sandeep.opstree.com 8090
addHost alok.opstree.com 8091
addHost rajiv.opstree.com 8092
