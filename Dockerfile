FROM debian:jessie
MAINTAINER jrstarke <docker@jamiestarke.com>

USER root

# Install ddclient
RUN \
  apt-get update -q && \
  apt-get install -qy wget libio-socket-ip-perl libio-socket-ssl-perl libjson-any-perl && \
  apt-get clean -y && \
  wget "http://downloads.sourceforge.net/project/ddclient/ddclient/ddclient-3.8.3/ddclient-3.8.3.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fddclient%2Ffiles%2Fddclient%2Fddclient-3.8.3%2F&ts=1464485224&use_mirror=heanet" -O ddclient-3.8.3.tar.gz && \
  tar -xzf ddclient-3.8.3.tar.gz && \
  cd ddclient-3.8.3 && \
  cp ddclient /usr/sbin/ && \
  mkdir /etc/ddclient && \
  mkdir -p /var/cache/ddclient

# Use ddclient
CMD ["/usr/sbin/ddclient","-daemon=60","-debug","-verbose","-noquiet","-foreground"]

ONBUILD ADD ddclient.conf /etc/ddclient/ddclient.conf
