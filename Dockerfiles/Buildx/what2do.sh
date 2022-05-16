echo "this file is only for documentation purposes, do not run it!"; exit 1

# create new builder instance
docker buildx create --use --platform linux/amd64,linux/arm64

# build multiarch registry
docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --output=type=registry \
    -t shanduur/hello-docker:buildx \
    .
