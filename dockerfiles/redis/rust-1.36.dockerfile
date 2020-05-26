
FROM rust:1.36.0 
COPY Cargo.lock /app/Cargo.lock 
COPY Cargo.toml /app/Cargo.toml 
COPY main.rs /app/main.rs 
WORKDIR /app
CMD cargo run app/main.rs
