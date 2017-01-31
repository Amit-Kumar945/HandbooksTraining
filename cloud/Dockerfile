FROM ubuntu:14.04

RUN apt-get update && apt-get -y --force-yes install wget vim git unzip

WORKDIR /usr/local/terraform
RUN wget https://releases.hashicorp.com/terraform/0.7.9/terraform_0.7.9_linux_amd64.zip && unzip terraform_0.7.9_linux_amd64.zip

ENV AWS_ACCESS_KEY_ID xxx
ENV AWS_SECRET_ACCESS_KEY xxx
ENV PATH $PATH:/usr/local/terraform

WORKDIR /root

VOLUME /root/terraform
