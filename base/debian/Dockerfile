FROM     debian:wheezy

MAINTAINER Bai Xiaoyong "lostitle@gmail.com"

# make sure the package repository is up to date
RUN apt-get update

# Install OpenSSH, git, vim
RUN apt-get install -y openssh-server ca-certificates supervisor git vim wget
RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor

RUN echo 'root:root' |chpasswd

# Define mountable directories.
VOLUME ["/mydata"]

# Define working directory.
WORKDIR /mydata

RUN echo "\
[supervisord]\n\
nodaemon=true\n\
\n\
[program:sshd]\n\
command=/usr/sbin/sshd -D\n\
\n\
" > /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]

EXPOSE 22
