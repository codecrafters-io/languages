
//main objective is to start TCP server on port 6379 , which is the default port that Redis uses

fn main() {
    use std::net::TcpListener; // I am using TCP Listener to listen for TCP connections
  
  let listener = TcpListener::bind("127.0.0.1:6379").unwrap(); //I am connecting to IP 127.0.0.1 at port 6379 to redis server and IP address is actually indicating client's PC and bind function is used to create binding to the port
  
  println!("Connection established"); // show message connection established after accessing the port
  }
  