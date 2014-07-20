FROM mycrypt/debian-java
MAINTAINER Bai Xiaoyong lostitle@gmail.com

RUN mkdir /opt/kafka
RUN wget -qO- http://www.eu.apache.org/dist/kafka/0.8.1.1/kafka_2.10-0.8.1.1.tgz \
  | tar zxvf - -C /opt/kafka --strip 1

ADD http://repo1.maven.org/maven2/org/slf4j/slf4j-log4j12/1.7.7/slf4j-log4j12-1.7.7.jar /opt/kafka/libs/slf4j-log4j12-1.7.7.jar

RUN echo "KAFKA_HOME=/opt/kafka" >> /etc/environment
ENV KAFKA_HOME /opt/kafka

RUN echo "PATH=/opt/kafka/bin:$PATH" >> /etc/environment
ENV PATH /opt/kafka/bin:$PATH

EXPOSE 9092 2181

RUN echo "#! /bin/sh\n\
\n\
/usr/sbin/sshd -D\n\
cd /opt/kafka\n\
nohup bin/zookeeper-server-start.sh config/zookeeper.properties > zookeeper.log &\n\
nohup bin/kafka-server-start.sh config/server.properties > server.log &\n\
" >/opt/run.sh; chmod 755 /opt/run.sh

ENTRYPOINT /opt/run.sh > /opt/run.log
CMD ["--help"]
