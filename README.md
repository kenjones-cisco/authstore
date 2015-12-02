## Vault with Consul backend integration

Creating an image for running Vault with integration with Consul. The base image `Dockerfile.base` starts with `alpine:3.2` and includes an additional alpine repository for installing vault and consul.

Creating base image:
```bash
./build.sh
```

The Vault image will include the vault binary and the consul binary, along with the respective configuration files. The consul binary is used in client mode to enable working with a Consul HA configuration. To make sure both vault and consul are running as expected, the process manager `runit` is used. The `vault/service` directory holds the scripts to start each process (they are extremely simple).

The Consul image will only include the consul binary and configuration file.

Creating the Vault and Consul images (assume in `authstore/`):
```bash
docker-compose build
```

**This assumes you are using docker-engine 1.9.x and docker-compose 1.5.x**

To start the Consul server and the Vault server up:
```bash
docker-compose --x-networking up -d
```

### Pre-built images

- https://hub.docker.com/r/kenjones/authstore-consul/
- https://hub.docker.com/r/kenjones/authstore-vault/

Simple `docker-compose.yml` that uses the pre-built images.

```yaml
consul:
  container_name: consul
  image: kenjones/authstore-consul
  command: "agent -config-file=/etc/consul.json"
  ports:
    - "8301"
    - "8302"
    - "8400"
    - "8500"
    - "8600"
vault:
  container_name: vault
  image: kenjones/authstore-vault
  cap_add:
    - IPC_LOCK
  ports:
    - "8200"
```
