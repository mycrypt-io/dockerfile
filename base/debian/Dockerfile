FROM     debian:wheezy

MAINTAINER Bai Xiaoyong "lostitle@gmail.com"

# make sure the package repository is up to date
RUN apt-get update

# Install OpenSSH, git, vim
RUN apt-get install -y openssh-server ca-certificates git vim
RUN mkdir /var/run/sshd
RUN echo 'root:root' |chpasswd

# Define mountable directories.
VOLUME ["/mydata"]

# Define working directory.
WORKDIR /mydata

CMD ["/usr/sbin/sshd", "-D"]
EXPOSE 22
