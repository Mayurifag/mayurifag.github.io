# syntax = edrevo/dockerfile-plus

INCLUDE+ common.Dockerfile

COPY docker-entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 4567

CMD [ "bundle", "exec", "middleman", "--bind-address", "0.0.0.0" ]
