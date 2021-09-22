FROM rust:1.43-alpine

COPY Cargo.toml /app/Cargo.toml
COPY Cargo.lock /app/Cargo.lock

RUN mkdir /app/src
RUN echo 'fn main() { println!("Hello World!"); }' > /app/src/main.rs

WORKDIR /app
RUN cargo build --release --target-dir=/tmp/codecrafters-docker-target

RUN cargo clean -p docker-starter-rust --release --target-dir=/tmp/codecrafters-docker-target

RUN rm -rf /app/src
