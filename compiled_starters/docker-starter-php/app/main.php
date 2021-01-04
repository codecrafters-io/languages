<?php
// Usage: your_docker.sh run <image> <command> <arg1> <arg2> ...

// Disable output buffering.
while (ob_get_level() !== 0) {
  ob_end_clean();
}

echo "Implement your program here!";

// Uncomment this to pass the first stage.
// $command = $argv[3];
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
//   exec(implode(' ', array_slice($argv, 3)));
// }
