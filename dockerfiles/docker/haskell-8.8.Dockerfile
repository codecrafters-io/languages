FROM haskell:8.8.3-buster

RUN apt-get install curl

# Download docker-explorer
ARG docker_explorer_version=v18
RUN curl --fail -Lo /usr/local/bin/docker-explorer https://github.com/codecrafters-io/docker-explorer/releases/download/${docker_explorer_version}/${docker_explorer_version}_linux_amd64
RUN chmod +x /usr/local/bin/docker-explorer

WORKDIR /app

# Absence of this causes `stack run` to raise permissionins error
RUN mkdir -p /etc/stack
RUN echo "allow-different-user: true" > /etc/stack/config.yaml

COPY stack.yaml package.yaml stack.yaml.lock /app/
RUN stack build --system-ghc --dependencies-only

# Add and Install Application Code
COPY . /app
RUN stack build
