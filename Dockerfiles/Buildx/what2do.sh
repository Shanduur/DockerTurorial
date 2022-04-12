docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --output=type=registry \
    -t shanduur/hello-docker:buildx \
    .
