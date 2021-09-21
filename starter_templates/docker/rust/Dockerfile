FROM rust:1.55-alpine AS builder

# Grab the dependencies and compile them as they dont change much
WORKDIR /app
COPY Cargo.lock Cargo.toml .
RUN mkdir src && echo "fn main() {}" > "src/main.rs"
RUN cargo build --release

RUN apk add curl

# Download docker-explorer
ARG docker_explorer_version=v18
RUN curl -Lo /usr/local/bin/docker-explorer https://github.com/codecrafters-io/docker-explorer/releases/download/${docker_explorer_version}/${docker_explorer_version}_linux_amd64
RUN chmod +x /usr/local/bin/docker-explorer

# Grab the real code
ADD . /app
WORKDIR /app

ENTRYPOINT ["/app/your_docker.sh"]
