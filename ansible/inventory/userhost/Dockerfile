FROM rastasheep/ubuntu-sshd:14.04

ARG name

# Adding User
RUN useradd -m -s /bin/bash $name

# Setting Root Password
RUN echo "$name:password" | chpasswd

