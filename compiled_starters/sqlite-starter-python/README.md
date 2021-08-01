This is a starting point for Python solutions to the
["Build Your Own SQLite" Challenge](https://codecrafters.io/challenges/sqlite).

In this challenge, you'll build a barebones SQLite implementation that supports
basic SQL statements like `SELECT`/`INSERT`. Along the way we'll learn about
[SQLite's file format](https://www.sqlite.org/fileformat.html), how indexed data
is stored in B-trees and more.

**Note**: If you're viewing this repo on GitHub, head over to
[codecrafters.io](https://codecrafters.io) to signup for early access.

# Passing the first stage

CodeCrafters runs tests when you do a `git push`. Make an empty commit and push
your solution to see the first stage fail.

```sh
git commit --allow-empty -m "Running tests"
git push origin master
```

You should see a failure message that says it expected "number of tables: <n>"
to be present.

Go to `app/main.py` and uncomment the `.dbinfo` command implementation. Commit
and push your changes to pass the first stage:

```sh
git add .
git commit -m "pass the first stage"
git push origin master
```

Time to move on to the next stage!

# Running Locally

1. Ensure you have `python (3.8)` installed locally
1. Run `./your_sqlite3.sh` to run your program, which is implemented in
   `app/main.py`.
1. Commit your changes and run `git push origin master` to submit your solution
   to CodeCrafters. Test output will be streamed to your terminal.
