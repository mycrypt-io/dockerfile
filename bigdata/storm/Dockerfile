FROM mycrypt/debian-java
MAINTAINER Bai Xiaoyong lostitle@gmail.com

# Install supervisor and others useful packages 
RUN apt-get install -y supervisor wget tar curl

# Create storm group and user
ENV STORM_VERSION 0.9.2-incubating
ENV STORM_HOME /usr/share/apache-storm-$STORM_VERSION

RUN groupadd storm; useradd --gid storm --home-dir /opt/storm --create-home --shell /bin/bash storm

# Install apache storm
RUN curl -s http://mir2.ovh.net/ftp.apache.org/dist/incubator/storm/apache-storm-$STORM_VERSION/apache-storm-$STORM_VERSION.tar.gz | tar -v -C /usr/share -xz
#RUN wget http://mir2.ovh.net/ftp.apache.org/dist/incubator/storm/apache-storm-$STORM_VERSION/apache-storm-$STORM_VERSION.tar.gz 
#RUN tar -xzvf apache-storm-$STORM_VERSION.tar.gz -C /usr/share
#RUN rm -rf apache-storm-$STORM_VERSION.tar.gz

RUN mkdir /var/log/storm ; chown -R storm:storm /var/log/storm ; ln -s /var/log/storm /opt/storm/log
RUN ln -s $STORM_HOME/bin/storm /usr/bin/storm
ADD conf/cluster.xml $STORM_HOME/logback/cluster.xml
ADD conf/storm.yaml $STORM_HOME/conf/storm.yaml

# Add scripts required to run storm daemons under supervision
ADD script/startup.sh /opt/storm/startup.sh
ADD supervisor/storm-supervisor.conf /opt/storm/storm-supervisor.conf

RUN chmod u+x /opt/storm/startup.sh
RUN chown -R storm:storm $STORM_HOME

# Tells Supervisor to run interactively rather than daemonize
RUN echo [supervisord] | tee -a /etc/supervisor/supervisord.conf ; echo nodaemon=true | tee -a /etc/supervisor/supervisord.conf

#ENTRYPOINT ["/opt/storm/startup.sh"]
