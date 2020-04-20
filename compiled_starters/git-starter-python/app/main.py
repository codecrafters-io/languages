import sys
import os


def main():
    print("Your code goes here!")

    # Uncomment this block to pass the first stage
    
    command = sys.argv[1]
    if command == "init":
    os.mkdir(".git")
    os.mkdir(".git/objects")
    os.mkdir(".git/refs")
    with open(".git/HEAD", "w") as f:
    f.write("ref: refs/heads/master\n")
    print("Initialized git directory")
    else:
    raise RuntimeError(f"Unknown command #{command}")


if __name__ == "__main__":
    main()
