FROM ubuntu:19.04
FROM openjdk:8

ENV BUILD_DATE=30092020
ENV MULE_HOME=/opt/mule
ENV MULE_VERSION=4.3

RUN mkdir muletirapa
RUN ls -la
COPY mule-ee-distribution-standalone-4.3.0.zip /muletirapa
RUN cd /muletirapa & ls -la

RUN cd ../opt && unzip /muletirapa/mule-ee-distribution-standalone-4.3.0.zip && ls -la
RUN ln -s /opt/mule-enterprise-standalone-4.3.0 ${MULE_HOME}

RUN chmod 777 /opt/mule-enterprise-standalone-4.3.0/bin/mule
RUN chmod 777 /opt/mule-enterprise-standalone-4.3.0/bin/launcher

CMD ["/opt/mule-enterprise-standalone-4.3.0/bin/mule"]

EXPOSE 9082

COPY pro-domain-1.0.0-SNAPSHOT-mule-domain.jar /opt/mule-enterprise-standalone-4.3.0/domains
