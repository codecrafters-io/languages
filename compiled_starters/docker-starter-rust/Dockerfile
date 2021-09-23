FROM rust:1.54-buster

# Download docker-explorer
ARG docker_explorer_version=v18
RUN curl --fail -Lo /usr/local/bin/docker-explorer https://github.com/codecrafters-io/docker-explorer/releases/download/${docker_explorer_version}/${docker_explorer_version}_linux_amd64
RUN chmod +x /usr/local/bin/docker-explorer

# Grab the dependencies and compile them as they dont change much
COPY Cargo.toml /app/Cargo.toml
COPY Cargo.lock /app/Cargo.lock

RUN mkdir /app/src
RUN echo 'fn main() { println!("Hello World!"); }' > /app/src/main.rs

WORKDIR /app
RUN cargo build --release --target-dir=/tmp/codecrafters-docker-target
RUN cargo clean -p docker-starter-rust --release --target-dir=/tmp/codecrafters-docker-target

# Grab the real code
ADD . /app

ENTRYPOINT ["/app/your_docker.sh"]
