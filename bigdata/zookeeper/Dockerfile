FROM mycrypt/debian-java
MAINTAINER Bai Xiaoyong lostitle@gmail.com

RUN wget -q -O - http://apache.mirrors.pair.com/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz | tar -xzf - -C /opt
RUN cp /opt/zookeeper-3.4.6/conf/zoo_sample.cfg /opt/zookeeper-3.4.6/conf/zoo.cfg


RUN echo "\
[program:zookeeper]\n\
command=/opt/zookeeper-3.4.6/bin/zkServer.sh start-foreground\n\
" >>/etc/supervisor/conf.d/supervisord.conf


EXPOSE 2181 2888 3888
