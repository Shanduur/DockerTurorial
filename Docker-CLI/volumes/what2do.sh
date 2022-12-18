echo "this file is only for documentation purposes, do not run it!"; exit 1

# data persistency in container
docker run -it ubuntu bash
    # cd /mnt
    # echo "hello docker" > hello.txt
    # cat /mnt/hello.txt
    # exit

# start again and check if file exists
docker run -it ubuntu bash
    # cat /mnt/hello.txt
    # exit

# create new volume
docker volume create my-volume

# view info about docker volume
docker volume inspect my-volume

# start new container with mounted volume
docker run -it --rm \
    -v my-volume:/mnt/ \
    ubuntu bash
    # cd /mnt
    # echo "hello docker" > hello.txt
    # cat /mnt/hello.txt
    # exit

# check if file exists
docker run -it --rm \
    -v my-volume:/mnt/ \
    ubuntu bash
    # cat /mnt/hello.txt
    # exit

# view the file from the host
ls /var/lib/docker/volumes/my-volume/_data
cat /var/lib/docker/volumes/my-volume/_data/hello.txt

docker run -p 8080:80 \
    --mount type=bind,source=$(pwd)/app,target=/usr/local/apache2/htdocs/ \
    httpd
