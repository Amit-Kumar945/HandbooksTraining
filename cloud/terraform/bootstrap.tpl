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

function setup_docker() {
  apt-get update
  apt-get -y install linux-image-extra-$(uname -r) linux-image-extra-virtual
  apt-get -y install apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  apt-key fingerprint 0EBFCD88
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  apt-get update
  apt-get -y install docker-ce
}

function setup_docker_compose() {
  curl -L --fail "https://github.com/docker/compose/releases/download/1.11.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
}

check_internet
setup_docker
setup_docker_compose
