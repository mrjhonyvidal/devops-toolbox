FROM ubuntu:19.04
FROM openjdk:8

# Define environment variables
ENV BUILD_DATE=09252020
ENV MULE_HOME=/opt/mule
ENV MULE_VERSION=4.3.0

RUN mkdir mulezip
RUN ls -la
COPY mule-ee-distribution-standalone-4.3.0.zip /mulezip
RUN cd /mulezip && ls -la

RUN cd ../opt && unzip /mulezip/mule-ee-distribution-standalone-4.3.0.zip && ls -la
RUN ln -s /opt/mule-enterprise-standalone-4.3.0 ${MULE_HOME}

RUN chmod 777 $MULE_HOME/bin/mule
RUN chmod 777 $MULE_HOME/bin/launcher

CMD ["/opt/mule/bin/mule"]

EXPOSE 9082

##COPY my-application-1.0.0-SNAPSHOT-mule-application.jar ${MULE_HOME}/apps