FROM ubuntu:14.04

RUN apt-get update && apt-get -y install wget vim git unzip

WORKDIR /usr/local/terraform
RUN wget https://releases.hashicorp.com/terraform/0.6.16/terraform_0.6.16_linux_amd64.zip && unzip terraform_0.6.16_linux_amd64.zip

WORKDIR /root

COPY setAwsCreds.sh .
RUN /root/setAwsCreds.sh
