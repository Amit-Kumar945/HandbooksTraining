FROM ubuntu:14.04

RUN apt-get update && apt-get -y install git vim wget

#RUN wget https://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb && dpkg -i puppetlabs-release-pc1-trusty.deb

#RUN apt-get update &&  apt-get -y install puppet-agent

#ENV PATH $PATH:/opt/puppetlabs/bin

COPY runlist runlist
