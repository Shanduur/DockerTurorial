FROM alpine:latest AS build

RUN apk add --no-cache \
    gcc \
    musl-dev
RUN mkdir -p /example/project
WORKDIR /example/project

COPY src/hello.c hello.c

RUN gcc -o hello hello.c

FROM alpine:latest AS runtime

COPY --from=build /example/project/hello /bin/hello

ENTRYPOINT [ "/bin/hello" ]
CMD [ "Adam" ]