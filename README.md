# Docker ahoi! - Round 1

## Goals

* Write your own Dockerfile
* Learn basic Docker Commands

## Help

* [Docs](https://docs.docker.com)
* [Docs > Dockerfile](https://docs.docker.com/engine/reference/builder/)
* [Docs > Commandline](https://docs.docker.com/engine/reference/commandline/cli)

## Tasks - Round 1

### Write your first Dockerfile

Fill out `Dockerfile`

### Build docker image

```shell
$ docker build -t flask-app-image:latest .
```

___

### Run docker container

```shell
$ docker --publish $DOCKER_IP:5000:5000 --name=my-flask-app-container flask-app-image
```

Default image name points to latest. Alternatively `-P` exposes all internal
ports, including base images.

___

### List running docker containers

```shell
$ docker ps
```

___

### Stop docker container

```shell
$ docker stop my-flask-app-container
```

___

### List all docker containers

```shell
$ docker ps -a
```

___

### Remove created container

```shell
$ docker rm my-flask-app-container
```

___

### Run docker container with removal

```shell
$ docker run --rm --publish 5000:5000 --name=my-flask-app-container flask-app-image
```

When container stops, it gets removed. Why not default? Not compatible with `-d`.

___

### Run docker container in background

```shell
$ docker run -d --publish 5000:5000 --name=my-flask-app-container flask-app-image
```

Why? It's not clear.

___

### Step into container

```shell
$ docker exec -it my-flask-app-container /bin/sh
```

* interactive
* tty

Rule: only one process per container. Container started with `--rm` stops when
we shell in and out?
___

### Stop container

```shell
$ docker stop my-flask-app-container
```
___

### Start container

```shell
$ docker start my-flask-app-container
```
___

### Run docker container and step into

```shell
$ docker run -p 5000:5000 --name=my-flask-app-container flask-app-image --rm -it flask-app-image sh
```
___

### Kill container with SIGTERM

```shell
$ docker kill my-flask-app-container
```
___

### Run docker container with mounted volume

```shell
$ docker rmi flask-app-image
```
