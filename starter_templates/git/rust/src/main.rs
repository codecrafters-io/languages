use std::env;
#[allow(unused_imports)]
use std::fs;

fn main() {
    println!("Your code goes here!");

    let args: Vec<String> = env::args().collect();
    if args[1] == "init" {
        // Uncomment this block to pass the first stage
        // fs::create_dir(".git").unwrap();
        // fs::create_dir(".git/objects").unwrap();
        // fs::create_dir(".git/refs").unwrap();
        // fs::write(".git/HEAD", "ref: refs/heads/master\n").unwrap();
        // println!("Initialized git directory")
    } else {
        println!("unknown command: {}", args[1])
    }
}
