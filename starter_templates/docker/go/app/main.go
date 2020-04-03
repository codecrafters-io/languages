package main

import (
	"fmt"
)

// Usage: your_docker.sh run <image> <command> <arg1> <arg2> ...
func main() {
	fmt.Println("Your code goes here!")

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
