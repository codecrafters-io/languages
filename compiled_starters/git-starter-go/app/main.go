package main

import (
	"fmt"
)

// Usage: your_git.sh run <image> <command> <arg1> <arg2> ...
func main() {
	fmt.Println("Your code goes here!")

	// Uncomment this block to pass the first stage!
	//
	// switch command := os.Args[1]; command {
	// case "init":
	//     for _, dir := range []string{".git", ".git/objects", ".git/refs"} {
	//         if err := os.Mkdir(dir, 0755); err != nil {
	//             fmt.Println("Error creating directory: %s", err)
	//         }
	//     }
	//     headFileContents := []byte("ref: refs/heads/master\n")
	//     if err := ioutil.WriteFile(".git/HEAD", headFileContents, 0644); err != nil {
	// 	       fmt.Println("Error writing file: %s", err)
	// 	   }
	//     fmt.Println("Initialized git directory")
	//
	// default:
	//     fmt.Println("Unknown command %s", command)
	//     os.Exit(1)
	// }
}
