FROM base-alpine:3.2

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 8600 8600/udp
ENV DNS_RESOLVES consul
ENV DNS_PORT 8600
ENV CONSUL_VERSION 0.5.2

RUN apk --update add consul@testing \
    && rm -f /var/cache/apk/* \
    && mkdir /data \
    && chown consul:consul /data

ENTRYPOINT ["consul"]

COPY consul.json /etc/consul.json
