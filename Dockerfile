# DOCKER-VERSION 1.10.3
# VERSION        1

FROM ubuntu:14.04
MAINTAINER Zhenyuan Wang <andriywzy@gmail.com>

# Install rsyslog
RUN apt-get update && apt-get -y -q install software-properties-common python-software-properties
RUN add-apt-repository ppa:adiscon/v8-stable
RUN apt-get update && apt-get -y -q install rsyslog

# modify config file /etc/rsyslog.conf
RUN sed 's/#$ModLoad imudp/$ModLoad imudp/' -i /etc/rsyslog.conf
RUN sed 's/#$UDPServerRun 514/$UDPServerRun 514/' -i /etc/rsyslog.conf
RUN sed 's/#$ModLoad imtcp/$ModLoad imtcp/' -i /etc/rsyslog.conf
RUN sed 's/#$InputTCPServerRun 514/$InputTCPServerRun 514/' -i /etc/rsyslog.conf

EXPOSE 514/tcp 514/udp

ENTRYPOINT ["/usr/sbin/rsyslogd"]
CMD ["-n"]
