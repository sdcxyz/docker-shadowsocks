FROM ubuntu:16.04
MAINTAINER sdcxyz@gmail.com
RUN apt-get update && apt-get install -y python-pip dnscrypt-proxy privoxy
RUN pip install shadowsocks
RUN echo 'listen-address 0.0.0.0:8118' >>/etc/privoxy/config
RUN echo 'forward-socks5  /       127.0.0.1:1080  .' >> /etc/privoxy/config
RUN echo '#!/bin/bash' >>/bootstrap.sh
RUN echo 'service  dnscrypt-proxy start' >>/bootstrap.sh
RUN echo 'service  privoxy start' >>/bootstrap.sh
RUN echo 'sslocal $@' >>/bootstrap.sh
RUN chmod +x /bootstrap.sh
EXPOSE  1080 53 8118
ENTRYPOINT ["/bootstrap.sh","-b","0.0.0.0"]

