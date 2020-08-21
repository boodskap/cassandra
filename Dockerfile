FROM ubuntu:18.04

MAINTAINER platform@boodskap.io

LABEL Remarks="Cassandra preconfigured for Boodskap IoT Platform"

WORKDIR /
RUN apt-get -y update && apt-get install -y software-properties-common curl sudo netcat
RUN add-apt-repository -y ppa:openjdk-r/ppa && apt-get update -y && apt-get install -y openjdk-8-jdk
RUN curl -sL https://archive.apache.org/dist/cassandra/3.11.5/apache-cassandra-3.11.5-bin.tar.gz | tar xzf - -C /root/
RUN mv /root/apache-cassandra-3.11.5/* /root/ && rm -rf /root/apache-cassandra-3.11.5
COPY etc/ /etc/
COPY root/ /root/
COPY init* /
COPY start-cassandra.sh .

RUN chmod +x /root/bin/*
RUN chmod +x start-cassandra.sh
RUN chmod +x init*.sh

EXPOSE 7000 7001 7199 9042 9160 9142

CMD ["/start-cassandra.sh"]
