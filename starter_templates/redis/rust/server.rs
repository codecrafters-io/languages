
//main objective is to start TCP server on port 6379 , which is the default port that Redis uses

fn main() {
    use std::net::TcpListener; 
  
  TcpListener::bind("127.0.0.1:6379").unwrap(); 
  
  println!("Connection established"); 
  }
  