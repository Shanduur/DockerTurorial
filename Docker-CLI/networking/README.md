## create new network with bridge driver

```sh
docker network create --driver bridge alpine-net
```

## create some containers with different options

```sh
docker run -dit --name alpine1 --network alpine-net alpine ash
```

```sh
docker run -dit --name alpine2 --network alpine-net alpine ash
```

```sh
docker run -dit --name alpine3 alpine ash
```

## inspect alpine-net network

```sh
docker network inspect alpine-net
```

## connect to container to check network connection

```sh
docker container attach alpine1
```

```sh
ping -c 2 alpine2
```

```sh
ping -c 2 alpine3
```

```sh
ping -c 2 google.com
```

*CTRL-P CTRL-Q for detach*

## connect to other container to check network connection

```sh
docker container attach alpine3
```

```sh
ping -c 2 alpine2
```

```sh
ping -c 2 alpine3
```

```sh
ping -c 2 google.com
```

*CTRL-P CTRL-Q for detach*
