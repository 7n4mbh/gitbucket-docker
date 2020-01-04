FROM openjdk:8-alpine

ADD https://github.com/gitbucket/gitbucket/releases/download/4.33.0/gitbucket.war /opt/gitbucket.war

COPY gitbucket.sh /opt/gitbucket.sh

RUN ln -s /gitbucket /root/.gitbucket

RUN apk add --no-cache mysql-client

VOLUME /gitbucket

# Port for web page
EXPOSE 8080

# Port for SSH access to git repository (Optional)
EXPOSE 29418

CMD ["/opt/gitbucket.sh", "db"]