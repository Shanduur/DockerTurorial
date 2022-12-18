## create new builder instance

```sh
docker buildx create --use --platform linux/amd64,linux/arm64
```

## build multiarch registry

```sh
docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --output=type=registry \
    -t shanduur/hello-docker:buildx \
    .
```
