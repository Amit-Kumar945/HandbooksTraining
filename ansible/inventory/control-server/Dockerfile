FROM ubuntu:14.04

RUN apt-get -y update && apt-get -y install git vim software-properties-common
RUN apt-add-repository -y ppa:ansible/ansible
RUN apt-get -y update && apt-get install -y ansible

ADD id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

RUN apt-get -y install sshpass

ADD hosts /hosts
