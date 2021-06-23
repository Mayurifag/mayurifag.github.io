# syntax = edrevo/dockerfile-plus

INCLUDE+ common.Dockerfile

RUN bundle exec middleman build

FROM busybox
COPY --from=common /mayurifag.github.io/build/ /www/
EXPOSE 8005
CMD httpd -p 8005 -h /www; tail -f /dev/null
