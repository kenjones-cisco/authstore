FROM base-alpine:3.2

ENV CONSUL_VERSION 0.5.2
ENV VAULT_VERSION 0.3.1

EXPOSE 8200

RUN apk --update add consul@testing vault@testing runit@testing \
    && rm -f /var/cache/apk/* \
    && mkdir /data \
    && chown consul:consul /data

COPY service /etc/service/
COPY vault.hcl /etc/vault.hcl
COPY consul.json /etc/consul.json

CMD ["runsvdir", "/etc/service"]
