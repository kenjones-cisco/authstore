FROM base-alpine:3.3

ENV VAULT_VERSION 0.5.3

EXPOSE 8200 8500

RUN apk --update add wget \
    && wget --quiet --output-document=/tmp/vault.zip https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip \
    && unzip /tmp/vault.zip -d /usr/sbin \
    && addgroup -S vault \
    && adduser -S -H -h /dev/null -s /sbin/nologin -D -G vault vault \
    && apk --purge del wget \
    && rm -f /var/cache/apk/* /tmp/vault.zip

COPY service /etc/service/
COPY vault.hcl /etc/vault.hcl
COPY consul.json /etc/consul.json
