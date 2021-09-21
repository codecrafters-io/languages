FROM rust:1.55-alpine AS builder

RUN apk add curl

# Download docker-explorer
ARG docker_explorer_version=v18
RUN curl -Lo /usr/local/bin/docker-explorer https://github.com/codecrafters-io/docker-explorer/releases/download/${docker_explorer_version}/${docker_explorer_version}_linux_amd64
RUN chmod +x /usr/local/bin/docker-explorer

ADD . /app
WORKDIR /app

ENTRYPOINT ["/app/your_docker.sh"]
