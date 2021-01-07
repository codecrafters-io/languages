# Usage: your_docker.sh run <image> <command> <arg1> <arg2> ...

import sys
import os

def main():
    print("Your code goes here!")

    # Uncomment this block to pass the first stage
    # child_pid = os.fork()
    # if child_pid == -1:
    #     print("Error forking!")
    # elif child_pid:
    #     status = os.wait()
    #     print("Child terminates!")
    # else:
    #     # Replace current program with calling program.
    #     print(os.system(' '.join(sys.argv[3:])))

if __name__ == "__main__":
    main()
