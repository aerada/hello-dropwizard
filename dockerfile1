#FROM jamesdbloom/docker-java8-maven
#WORKDIR /app
#COPY pom.xml /app/pom.xml
#COPY src /app/src
#COPY example.yaml /app/example.yaml
#RUN  curl -O -u admin:admin123  http://104.211.214.150:8081/nexus/content/repositories/releases/com/pragtech/hello-dropwizard/1.0/hello-dropwizard-1.0.jar
#EXPOSE 8080
#CMD sh start.sh

# Pull base image.
#FROM ubuntu:latest

#ENV JAVA_HOME       /usr/lib/jvm/java-8-oracle

#RUN apt-get update -y && \
#apt-get -y install software-properties-common -y && \
#add-apt-repository -y ppa:webupd8team/java -y && \
#echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
#echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
#apt-get update && \
#apt-get -y install oracle-java8-installer 
#RUN java -version
#RUN apt-get install curl -y
#WORKDIR /opt
#COPY pom.xml /opt/pom.xml
#COPY src /opt/src
#COPY example.yaml /opt/example.yaml
#RUN  curl -O -u admin:admin123  http://104.211.214.150:8081/nexus/content/repositories/releases/com/pragtech/hello-dropwizard/1.0/hello-dropwizard-1.0.jar
#EXPOSE 8082
#CMD java -jar hello-dropwizard-1.0.jar server example.yaml

FROM maven:3.5.2-jdk-8-alpine as build

RUN mkdir /app

WORKDIR /app

COPY . .

RUN mvn package

EXPOSE 8085

FROM java:8-jre-alpine

RUN mkdir /app

WORKDIR /app

COPY --from=build /app /app

CMD java -jar hello-dropwizard-1.0.jar server example.yaml
