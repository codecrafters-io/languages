<?php
// Usage: your_docker.sh run <image> <command> <arg1> <arg2> ...

// Disable output buffering.
while (ob_get_level() !== 0) {
  ob_end_clean();
}

// You can use print statements as follows for debugging, they'll be visible when running tests.
echo "Logs from your program will appear here!\n";

// Uncomment this to pass the first stage.
// $child_pid = pcntl_fork();
// if ($child_pid == -1) {
//   echo "Error forking!";
// }
// elseif ($child_pid) {
//   // We're in parent.
//   pcntl_wait($status);
//   echo "Child terminates!";
// }
// else {
//   // Replace current program with calling program.
//   echo exec(implode(' ', array_slice($argv, 3)));
// }
