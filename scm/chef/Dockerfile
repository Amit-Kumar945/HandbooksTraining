FROM ubuntu:14.04

RUN apt-get update && apt-get -y install git vim wget

RUN wget https://packages.chef.io/stable/ubuntu/12.04/chefdk_0.19.6-1_amd64.deb

RUN dpkg -i chefdk_0.19.6-1_amd64.deb

#COPY runlist runlist

VOLUME /runlist
