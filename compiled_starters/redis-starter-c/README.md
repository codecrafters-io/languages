This is a starting point for C solutions to the
["Build Your Own Redis" Challenge](https://codecrafters.io/challenges/redis).

In this challenge, you'll build a toy Redis clone that's capable of handling
basic commands like `PING`, `SET` and `GET`. Along the way we'll learn about
event loops, the Redis protocol and more.

**Note**: If you're viewing this repo on GitHub, head over to
[codecrafters.io](https://codecrafters.io) to signup for early access.

# Usage

1. Ensure you have `gcc` installed locally
1. Run `./spawn_redis_server.sh` to run your Redis server, which is implemented
   in `app/server.c`.
1. Commit your changes and run `git push origin master` to submit your solution
   to CodeCrafters. Test output will be streamed to your terminal.

# Passing the first stage

CodeCrafters runs tests when you do a `git push`. Make an empty commit and push
your solution to see the first stage fail.

```sh
git commit --allow-empty -m "Running tests"
git push origin master
```

You should see a failure message that says it wasn't able to connect to port
`6379`.

Go to `app/server.c` and uncomment the server implementation. Commit and push
your changes to pass the first stage:

```sh
git add .
git commit -m "pass the first stage"
git push origin master
```

Time to move on to the next stage!
