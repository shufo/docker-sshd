docker-sshd
===========

A Dockerfile to build a sshd service with supervisord on Ubuntu 12.04

# Installation

- Copy your public key to `ssh/id_rsa.pub`
```sh
cp ~/.ssh/id_rsa.pub ssh/id_rsa.pub
```
- Build
```sh
docker build --no-cache --rm -t local/sshd .
```
- RUN container
```sh
ID=$(docker run -i -t -d -p 22 local/sshd)
```
- Login to your container
```sh
ssh localhost -p `docker port $ID 22 | cut -d":" -f2`
```

Root password is `root`
