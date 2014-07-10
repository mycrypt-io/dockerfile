FROM mycrypt/debian-java
MAINTAINER Bai Xiaoyong lostitle@gmail.com

RUN mkdir /opt/kafka
RUN wget -qO- http://www.eu.apache.org/dist/kafka/0.8.1.1/kafka_2.10-0.8.1.1.tgz \
  | tar zxvf - -C /opt/kafka --strip 1

ENV PATH /opt/kafka/bin:$PATH

EXPOSE 9092 7203
