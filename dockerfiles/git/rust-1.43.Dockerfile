FROM rust:1.43-buster

COPY Cargo.toml /app/Cargo.toml
COPY Cargo.lock /app/Cargo.lock

RUN mkdir /app/src
RUN echo 'fn main() { println!("Hello World!"); }' > /app/src/main.rs

WORKDIR /app
RUN cargo build --release --target-dir=/tmp/codecrafters-git-target

RUN sleep 5 # Maybe this will help with busting the cache??

RUN rm -rf /app/src
COPY . /app
