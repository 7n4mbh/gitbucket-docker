FROM alpine:3.11

COPY backup.sh /opt/backup.sh
RUN chmod +x /opt/backup.sh
RUN echo -e "0\t3\t*\t*\t*\t/opt/backup.sh" >> /var/spool/cron/crontabs/root

RUN apk --update add tzdata mysql-client && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    rm -rf /var/cache/apk/*

CMD ["/usr/sbin/crond","-l","2","-f"]