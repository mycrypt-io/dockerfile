FROM mycrypt/debian
MAINTAINER Bai Xiaoyong lostitle@gmail.com

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget nginx-full
RUN (cd /tmp && wget --no-check-certificate https://github.com/elasticsearch/kibana/archive/v3.0.0milestone5.tar.gz -O pkg.tar.gz && tar zxf pkg.tar.gz && cd kibana-* && cp -rf ./* /usr/share/nginx/www/)
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
ADD run.sh /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
RUN rm -rf /tmp/*

EXPOSE 80

RUN echo "\
[program:kibana]\n\
command=/usr/local/bin/run\n\
" >> /etc/supervisor/conf.d/supervisord.conf
