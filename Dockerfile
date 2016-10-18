FROM ubuntu:16.04
MAINTAINER sdcxyz@gmail.com
RUN apt-get update && apt-get install -y python-pip dnscrypt-proxy
RUN pip install shadowsocks
RUN echo '#!/bin/bash' >>/bootstrap.sh
RUN echo 'service  dnscrypt-proxy start' >>/bootstrap.sh
RUN echo 'sslocal $@' >>/bootstrap.sh
RUN chmod +x /bootstrap.sh
EXPOSE  1080 53

ENTRYPOINT ["/bootstrap.sh","-b","0.0.0.0"]

