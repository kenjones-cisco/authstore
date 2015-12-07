FROM base-alpine:3.2

ENV VAULT_VERSION 0.3.1

EXPOSE 8200

RUN apk --update add vault@testing \
    && rm -f /var/cache/apk/*

COPY service /etc/service/
COPY vault.hcl /etc/vault.hcl
COPY consul.json /etc/consul.json

