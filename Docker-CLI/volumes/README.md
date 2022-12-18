## data persistency in container

```sh
docker run -it ubuntu bash
```

```sh
cd /mnt
```

```sh
echo "hello docker" > hello.txt
```

```sh
cat /mnt/hello.txt
```

```sh
exit
```

## start again and check if file exists

```sh
docker run -it ubuntu bash
```

```sh
cat /mnt/hello.txt
```

```sh
exit
```

## create new volume

```sh
docker volume create my-volume
```

## view info about docker volume

```sh
docker volume inspect my-volume
```

## start new container with mounted volume

```sh
docker run -it --rm \
    -v my-volume:/mnt/ \
    ubuntu bash
```

```sh
cd /mnt
```

```sh
echo "hello docker" > hello.txt
```

```sh
cat /mnt/hello.txt
```

```sh
exit
```

## check if file exists

```sh
docker run -it --rm \
    -v my-volume:/mnt/ \
    ubuntu bash
```

```sh
cat /mnt/hello.txt
```

```sh
exit
```

## view the file from the host

```sh
ls /var/lib/docker/volumes/my-volume/_data
```

```sh
cat /var/lib/docker/volumes/my-volume/_data/hello.txt
```

```sh
docker run -p 8080:80 \
    --mount type=bind,source=$(pwd)/app,target=/usr/local/apache2/htdocs/ \
    httpd
```
