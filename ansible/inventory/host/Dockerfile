FROM rastasheep/ubuntu-sshd:14.04

#RUN apt-get -y update

ADD authroized_keys /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys
