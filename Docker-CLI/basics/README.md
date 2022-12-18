## docker container run run

```sh
docker container run --name hello-world hello-world
```

*ctrl-c*

## docker pull

```sh
docker pull nginx:latest
```

## docker container run parameters

```sh
docker container run nginx
```

*ctrl-c*

## exposing port

```sh
docker container run --expose 80 nginx
```

*ctrl-c*

## detaching from terminal

```sh
docker container run --detach --expose 80 nginx
```

## port mapping

```sh
docker container run --detach -p 8080:80 nginx
```

## listing containers

```sh
docker container ls
```

## inspecting container options

```sh
docker container inspect <container_id>
```

## viewing logs

```sh
docker container logs <container_id>
```

## stop and kill

```sh
docker container stop <container_id>
```

```sh
docker container kill <container_id>
```

## starting container with customized arguments

```sh
docker run --rm -it ubuntu:latest bash
```

*do some things*

```sh
exit
```

## starting container with customized entrypoint

```sh
docker run --rm -it --entrypoint bash ubuntu:latest
```

*do some things*

```sh
exit
```

## environmental variables

```sh
docker run --rm -it -e HELLO=WORLD ubuntu bash
```

```sh
echo $HELLO
```

```sh
exit
```