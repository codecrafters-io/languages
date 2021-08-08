This is a starting point for {{language_name}} solutions to the
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

``` sh
git commit --allow-empty -m "Running tests"
git push origin master
```

You should see a failure message that says it expected "number of tables: <n>" to
be present.

Go to `{{ user_editable_file }}` and uncomment the `.dbinfo` command implementation. Commit and
push your changes to pass the first stage:

``` sh
git add .
git commit -m "pass the first stage"
git push origin master
```

Time to move on to the next stage!

# Running Your Program Locally

1. Ensure you have `{{ required_executable }}` installed locally
1. Run `./your_sqlite3.sh` to run your program, which is implemented in
   `{{ user_editable_file }}`.{{# language_is_rust }} This command compiles your
   Rust project, so it might be slow the first time you run it. Subsequent runs
   will be fast.{{/ language_is_rust}}
1. Commit your changes and run `git push origin master` to submit your solution
   to CodeCrafters. Test output will be streamed to your terminal.
