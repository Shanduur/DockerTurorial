echo "this file is only for documentation purposes, do not run it!"; exit 1

# docker container run run
docker container run --name hello-world hello-world

# docker pull
docker pull nginx:latest

# docker container run parameters
docker container run nginx
    # ctrl-c

# exposing port
docker container run --expose 80 nginx
    # ctrl-c

# detaching from terminal
docker container run --detach --expose 80 nginx

# port mapping
docker container run --detach -p 8080:80 nginx

# listing containers
docker container ls

# inspecting container options
docker container inspect <container_id>

# viewing logs
docker container logs <container_id>

# stop and kill
docker container stop <container_id>
docker container kill <container_id>

# starting container with customized command
docker run --rm -it ubuntu:latest bash
    # do some things
    # exit

# environmental variables
docker run --rm -it -e HELLO=WORLD ubuntu bash
    # echo $HELLO
    # exit
