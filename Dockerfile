FROM ubuntu:14.04
MAINTAINER seamanhou <hhool.student@gmail.com>

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak &&  sed -i -e "s/archive\.ubuntu\.com/mirrors\.aliyun\.com/g" /etc/apt/sources.list \
    && apt-get -y update && apt-get install -y wget vim

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y software-properties-common
RUN apt-add-repository ppa:webupd8team/java && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get update -y
RUN apt-get install -y oracle-java8-installer && \
    apt-get install -y oracle-java8-unlimited-jce-policy && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/oracle-jdk8-installer

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib
ENV PATH $JAVA_HOME/bin:$PATH

