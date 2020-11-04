FROM jenkins/jenkins:lts

USER root

RUN apt-get -y update \
    && \
    apt-get -y upgrade \
    && \
    apt-get -y install maven

# Make installation with this user
USER jenkins