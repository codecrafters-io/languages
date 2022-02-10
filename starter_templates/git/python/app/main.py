import sys
import os


def main():
    # You can use print statements like this for debugging, they'll be visible when running tests.
    print("Logs from your program will appear here!")

    # Uncomment this block to pass the first stage
    #
    # command = sys.argv[1]
    # if command == "init":
    #     os.mkdir(".git")
    #     os.mkdir(".git/objects")
    #     os.mkdir(".git/refs")
    #     with open(".git/HEAD", "w") as f:
    #         f.write("ref: refs/heads/master\n")
    #     print("Initialized git directory")
    # else:
    #     raise RuntimeError(f"Unknown command #{command}")


if __name__ == "__main__":
    main()
