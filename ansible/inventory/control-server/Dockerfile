FROM ubuntu:14.04

RUN apt-get -y update && apt-get -y install git vim ansible

ADD id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

RUN apt-get -y install sshpass

ADD hosts /hosts
