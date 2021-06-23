


FROM busybox
COPY build/ /www/
EXPOSE 8005
CMD httpd -p 8005 -h /www; tail -f /dev/null
