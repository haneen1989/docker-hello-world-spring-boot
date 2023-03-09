FROM adoptopenjdk/openjdk11 

RUN mkdir -p /opt/app


RUN \
apt-get update && \
apt-get -y upgrade && \
apt-get install unzip wget -y 



ENV PROJECT_HOME /opt/app 

COPY /target/*.jar $PROJECT_HOME/app.jar

WORKDIR $PROJECT_HOME
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]
