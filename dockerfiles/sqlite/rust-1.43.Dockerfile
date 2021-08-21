FROM rust:1.43-buster

COPY Cargo.toml /app/Cargo.toml
COPY Cargo.lock /app/Cargo.lock

RUN mkdir /app/src
RUN echo 'fn main() { println!("Hello World!"); }' > /app/src/main.rs

WORKDIR /app
RUN cargo build --release --target-dir=/tmp/codecrafters-sqlite-target

RUN rm /tmp/codecrafters-sqlite-target/release/sqlite-starter-rust
RUN rm /tmp/codecrafters-sqlite-target/release/sqlite-starter-rust.d

RUN find /tmp/codecrafters-sqlite-target/release -type f -maxdepth 1 -delete
RUN rm -f /tmp/codecrafters-sqlite-target/release/deps/*sqlite_starter_rust*
RUN rm -f /tmp/codecrafters-sqlite-target/release/deps/sqlite_starter_rust*
RUN rm -f /tmp/codecrafters-sqlite-target/release/.fingerprint/*sqlite_starter_rust*
RUN rm -f /tmp/codecrafters-sqlite-target/release/.fingerprint/sqlite_starter_rust*

RUN rm -rf /app/src
