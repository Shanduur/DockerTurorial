echo "this file is only for documentation purposes, do not run it!"; exit 1

# create new network with bridge driver
docker network create --driver bridge alpine-net

# create some containers with different options
docker run -dit --name alpine1 --network alpine-net alpine ash
docker run -dit --name alpine2 --network alpine-net alpine ash
docker run -dit --name alpine3 alpine ash

# inspect alpine-net network
docker network inspect alpine-net

# connect to container to check network connection
docker container attach alpine1
    # ping -c 2 alpine2
    # ping -c 2 alpine3
    # ping -c 2 google.com
    # CTRL-P CTRL-Q for detach

# connect to other container to check network connection
docker container attach alpine3
    # ping -c 2 alpine2
    # ping -c 2 alpine3
    # ping -c 2 google.com
    # CTRL-P CTRL-Q for detach
