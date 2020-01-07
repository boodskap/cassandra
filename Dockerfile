FROM boodskapiot/ubuntu:18.04

MAINTAINER platform@boodskap.io

LABEL Remarks="Cassandra preconfigured for Boodskap IoT Platform"

WORKDIR /
RUN apt-get update
RUN apt-get -y update && apt-get install -y nginx sudo nodejs npm git software-properties-common netcat tar curl net-tools nano wget unzip rsyslog psmisc
RUN apt-get clean && apt-get autoclean && apt-get autoremove
RUN wget https://archive.apache.org/dist/cassandra/3.11.5/apache-cassandra-3.11.5-bin.tar.gz
RUN tar -xzf apache-cassandra-3.11.5-bin.tar.gz
RUN mv /apache-cassandra-3.11.5/* /root/
RUN rm -rf apache-cassandra-3.11.5*

COPY etc/ /etc/
COPY root/ /root/
COPY init* /
COPY start-cassandra.sh .

RUN chmod +x start-cassandra.sh
RUN chmod +x initdb.sh

EXPOSE 7000 7001 7199 9042 9160 9142

CMD ["/start-cassandra.sh"]
