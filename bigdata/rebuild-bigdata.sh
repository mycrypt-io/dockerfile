#!/bin/bash

docker build --rm -t="mycrypt/zookeeper" zookeeper
docker build --rm -t="mycrypt/kafka" kafka
docker build --rm -t="mycrypt/flume" flume
docker build --rm -t="mycrypt/storm" storm
docker build --rm -t="mycrypt/storm-nimbus" storm-nimbus
docker build --rm -t="mycrypt/storm-supervisor" storm-supervisor
docker build --rm -t="mycrypt/storm-ui" storm-ui
