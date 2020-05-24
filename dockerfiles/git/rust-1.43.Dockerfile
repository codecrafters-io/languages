FROM rust:1.43-buster

COPY Cargo.toml /app/Cargo.toml
COPY Cargo.lock /app/Cargo.lock

RUN mkdir /app/src
RUN echo 'fn main() { println!("Hello World!"); }' > /app/src/main.rs

WORKDIR /app
RUN cargo build --release --target-dir=/tmp/codecrafters-git-target

RUN rm /tmp/codecrafters-git-target/release/git-starter-rust
RUN rm /tmp/codecrafters-git-target/release/git-starter-rust.d

RUN rm -rf /app/src
COPY . /app

RUN ls /app
RUN ls /app/src
RUN cat /app/src/main.rs
