
FROM rust:1.36.0 
COPY Cargo.lock /app/Cargo.lock 
COPY Cargo.toml /app/Cargo.toml 
COPY main.rs /app/main.rs 
WORKDIR /app
RUN echo 'fn main() { use std::net::TcpListener; TcpListener::bind("127.0.0.1:6379").unwrap(); println!("Connection established"); }'> /app/main.rs 
CMD cargo run app/main.rs