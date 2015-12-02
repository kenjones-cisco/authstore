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

To run all the test cases, there is a NodeJS 4 Dockerfile in the dev/ directory of the project along with a build.sh script. If you are using the vagrant image then it was built during the initial `vagrant up`. Otherwise you can simply run the build.sh script to create the image `vaulted/nodejs:4`.

From the project root you can start a NodeJS container with connectivity to the Consul and Vault servers as follows:
```bash
docker run -it --rm -v `pwd`:/app --net=authstore vaulted/nodejs:4 /bin/bash
```

Run the test cases:
```bash
npm test
or
npm run coverage
```
