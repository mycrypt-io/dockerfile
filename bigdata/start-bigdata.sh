#!/bin/bash

docker rm -f mydata; docker run -d -P --name mydata mycrypt/debian
docker rm -f zookeeper; docker run -d -P --volumes-from mydata --name zookeeper mycrypt/zookeeper
docker rm -f kafka; docker run -d -P --volumes-from mydata --name kafka --link zookeeper:zookeeper mycrypt/kafka
docker rm -f flume; docker run -d -P --volumes-from mydata --name flume --link zookeeper:zookeeper --link kafka:kafka mycrypt/flume
docker rm -f storm-nimbus; docker run -d -P --volumes-from mydata --name storm-nimbus --link zookeeper:zookeeper --link kafka:kafka mycrypt/storm-nimbus
docker rm -f storm-supervisor; docker run -d -P --volumes-from mydata --name storm-supervisor --link zookeeper:zookeeper --link storm-nimbus:storm-nimbus mycrypt/storm-supervisor
docker rm -f storm-ui; docker run -d -P --volumes-from mydata --name storm-ui --link zookeeper:zookeeper --link storm-nimbus:storm-nimbus mycrypt/storm-ui

