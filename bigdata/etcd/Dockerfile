FROM mycrypt/debian
MAINTAINER Bai Xiaoyong lostitle@gmail.com

RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy build-essential curl git
RUN curl -s https://storage.googleapis.com/golang/go1.2.2.src.tar.gz | tar -v -C /usr/local -xz
RUN cd /usr/local/go/src && ./make.bash --no-clean 2>&1
ENV PATH /usr/local/go/bin:$PATH
RUN git clone https://github.com/coreos/etcd /opt/etcd
RUN cd /opt/etcd && ./build

EXPOSE 4001 7001

RUN echo "\
[program:etcd]\n\
command=/opt/etcd/bin/etcd\n\
" >> /etc/supervisor/conf.d/supervisord.conf
