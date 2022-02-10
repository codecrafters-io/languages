# Usage: your_docker.sh run <image> <command> <arg1> <arg2> ...

from os import commandLineParams
from osproc import execProcess


# You can use print statements like this for debugging, they'll be visible when running tests.
echo "Logs from your program will appear here"

# Uncomment this block to pass the first stage
#
# let command = commandLineParams()[2]
# let args = commandLineParams()[3..^1]
#
# let output = execProcess(command, "", args, options={})
# echo output
