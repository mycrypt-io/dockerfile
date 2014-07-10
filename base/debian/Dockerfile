FROM     debian:wheezy

MAINTAINER Bai Xiaoyong "lostitle@gmail.com"

# make sure the package repository is up to date
RUN apt-get update

# Install OpenSSH
RUN apt-get install -y openssh-server ca-certificates
RUN mkdir /var/run/sshd
RUN echo 'root:root' |chpasswd

CMD ["/usr/sbin/sshd", "-D"]
EXPOSE 22
