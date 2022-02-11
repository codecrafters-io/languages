package main

import (
	"fmt"
	// Uncomment this block to pass the first stage!
	//  "io/ioutil"
	//  "os"
)

// Usage: your_git.sh run <image> <command> <arg1> <arg2> ...
func main() {
	// You can use print statements as follows for debugging, they'll be visible when running tests.
	fmt.Println("Logs from your program will appear here!")

	// Uncomment this block to pass the first stage!
	//
	// switch command := os.Args[1]; command {
	// case "init":
	//     for _, dir := range []string{".git", ".git/objects", ".git/refs"} {
	//         if err := os.Mkdir(dir, 0755); err != nil {
	//             fmt.Printf("Error creating directory: %s\n", err)
	//         }
	//     }
	//     headFileContents := []byte("ref: refs/heads/master\n")
	//     if err := ioutil.WriteFile(".git/HEAD", headFileContents, 0644); err != nil {
	// 	       fmt.Printf("Error writing file: %s\n", err)
	// 	   }
	//     fmt.Println("Initialized git directory")
	//
	// default:
	//     fmt.Println("Unknown command %s", command)
	//     os.Exit(1)
	// }
}
