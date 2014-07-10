FROM mycrypt/debian-java
MAINTAINER Bai Xiaoyong lostitle@gmail.com

RUN mkdir /opt/flume
RUN wget -qO- https://archive.apache.org/dist/flume/1.5.0/apache-flume-1.5.0-bin.tar.gz \
  | tar zxvf - -C /opt/flume --strip 1

RUN echo "PATH=/opt/flume/bin:$PATH" >> /etc/environment 
ENV PATH /opt/flume/bin:$PATH
