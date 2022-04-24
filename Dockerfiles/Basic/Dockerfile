FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    gcc
RUN mkdir -p /example/project
WORKDIR /example/project

COPY src/hello.c hello.c

RUN gcc -o hello hello.c && mv ./hello /bin/hello

ENTRYPOINT [ "/bin/hello" ]
CMD [ "Adam" ]