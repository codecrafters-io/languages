use std::process::exit;
use std::error::Error;

// Usage: your_docker.sh run <image> <command> <arg1> <arg2> ...
fn main() -> Result<(), Box<dyn Error>> {
    println!("Your code goes here!");

    let args: Vec<_> = std::env::args().collect();
    let command = &args[3];
    let command_args = &args[4..];
    let output = std::process::Command::new(command)
        .args(command_args)
        .output()?;

    if output.status.success() {
        let std_out = std::str::from_utf8(&output.stdout)?;
        println!("{}", std_out)
    } else {
        exit(1);
    }

    Ok(())

}
