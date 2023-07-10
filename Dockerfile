FROM alpine:latest

ARG MAVEN_VERSION=3.9.3

RUN apk add --update wget zip openjdk17-jdk git

RUN wget -q -O /tmp/maven.zip https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.zip \
 && unzip /tmp/maven.zip -d /tmp/ \
 && mkdir -p /usr/local/maven/ \
 && mv /tmp/apache-maven-${MAVEN_VERSION}/* /usr/local/maven/ \
 && rm -Rf /tmp/apache-maven-${MAVEN_VERSION}/

RUN adduser -S -G root -D -u 1001 appuser

USER 1001
