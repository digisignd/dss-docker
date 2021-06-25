FROM openjdk:8-alpine
LABEL maintainer="info@ninjaneers.de"
LABEL "author"="Dennis Fricke"
LABEL "company"="Ninjaneers GmbH"

RUN  apk update && apk add unzip

ADD https://ec.europa.eu/cefdigital/artifact/repository/esignaturedss/eu/europa/ec/joinup/sd-dss/dss-demo-bundle/5.8.2/dss-demo-bundle-5.8.2.zip /tmp
RUN unzip /tmp/dss-demo-bundle-5.8.2.zip -d /tmp
RUN mv /tmp/dss-demo-bundle-5.8.2 /dss
RUN chmod +x /dss/apache-tomcat-8.5.61/bin/catalina.sh

COPY ./startup.sh /dss/

ENTRYPOINT [ "/dss/startup.sh" ]
CMD [ "/bin/sh" ]
