FROM mycrypt/debian-java
MAINTAINER Bai Xiaoyong lostitle@gmail.com

RUN mkdir /opt/kafka
RUN wget -qO- http://www.eu.apache.org/dist/kafka/0.8.1.1/kafka_2.10-0.8.1.1.tgz \
  | tar zxvf - -C /opt/kafka --strip 1

ADD http://repo1.maven.org/maven2/org/slf4j/slf4j-log4j12/1.7.7/slf4j-log4j12-1.7.7.jar /opt/kafka/libs/slf4j-log4j12-1.7.7.jar

RUN sed -i -e"s/^zookeeper.connect\s*=\s*localhost:2181/zookeeper.connect=zookeeper:2181/" /opt/kafka/config/server.properties
RUN sed -i -e"/esac/a if ! egrep \"^advertised.host.name=.*\" /opt/kafka/config/server.properties; then\n\
        sed -i -e\"/#advertised.host.name=<hostname routable by clients>/a advertised.host.name=\$(hostname -i)\" /opt/kafka/config/server.properties\n\
fi\n\
" /opt/kafka/bin/kafka-server-start.sh

RUN echo "KAFKA_HOME=/opt/kafka" >> /etc/environment
ENV KAFKA_HOME /opt/kafka

RUN echo "PATH=/opt/kafka/bin:$PATH" >> /etc/environment
ENV PATH /opt/kafka/bin:$PATH

RUN echo "\
[program:kafka-server]\n\
command=/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties\n\
" >> /etc/supervisor/conf.d/supervisord.conf

EXPOSE 9092 2181
