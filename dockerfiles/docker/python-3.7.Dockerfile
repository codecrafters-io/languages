FROM jfloff/alpine-python:3.7

RUN apk add --update-cache --upgrade curl
RUN apk add --update-cache --upgrade curl-dev

# Download docker-explorer.
ARG docker_explorer_version=v18
RUN curl --fail -Lo /usr/local/bin/docker-explorer https://github.com/codecrafters-io/docker-explorer/releases/download/${docker_explorer_version}/${docker_explorer_version}_linux_amd64
RUN chmod +x /usr/local/bin/docker-explorer

COPY . /app
WORKDIR /app
