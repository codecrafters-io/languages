package main

import (
	"fmt"
	// Uncomment this block to pass the first stage!
	//  "os"
	//  "os/exec"
)

// Usage: your_docker.sh run <image> <command> <arg1> <arg2> ...
func main() {
    // You can use print statements like this for debugging, they'll be visible when running tests.
	fmt.Println("Logs from your program will appear here!")

	// Uncomment this block to pass the first stage!
	//
	// command := os.Args[3]
	// args := os.Args[4:len(os.Args)]
	//
	// cmd := exec.Command(command, args...)
	// output, err := cmd.Output()
	// if err != nil {
	// 	fmt.Printf("Err: %v", err)
	// 	os.Exit(1)
	// }
	//
	// fmt.Println(string(output))
}
