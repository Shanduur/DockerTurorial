echo "this file is only for documentation purposes, do not run it!"; exit 1

# build multistage docker container
docker build -t shanduur/hello-docker:multi-stage .
