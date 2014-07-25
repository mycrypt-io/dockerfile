FROM mycrypt/storm
MAINTAINER Bai Xiaoyong lostitle@gmail.com

EXPOSE 6700
EXPOSE 6701
EXPOSE 6702
EXPOSE 6703
EXPOSE 8000

ADD start-supervisor.sh /usr/bin/start-supervisor.sh

RUN /usr/bin/config-supervisord.sh supervisor
RUN /usr/bin/config-supervisord.sh logviewer

CMD /usr/bin/start-supervisor.sh
