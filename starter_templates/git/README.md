This is a starting point for {{language_name}} solutions to the
["Build Your Own Git" Challenge](https://codecrafters.io/challenges/git).

In this challenge, you'll build a small Git implementation that's capable of
initializing a repository, creating commits and cloning a public repository.
Along the way we'll learn about the `.git` directory, Git objects (blobs,
commits, trees etc.), Git's transfer protocols and more.

**Note**: If you're viewing this repo on GitHub, head over to
[codecrafters.io](https://codecrafters.io) to signup for early access.

# Usage

1. Ensure you have `{{ required_executable }}` installed locally
1. Run `./your_git_.sh` to run your Git implementation, which is implemented in
   `{{ user_editable_file }}`.
1. Commit your changes and run `git push origin master` to submit your solution
   to CodeCrafters. Test output will be streamed to your terminal.
 
# Passing the first stage

CodeCrafters runs tests when you do a `git push`. Make an empty commit and push
your solution to see the first stage fail.
   
``` sh
git commit --allow-empty -m "Running tests"
git push origin master
```

You should see a failure message that says the `.git` directory wasn't
initialized. 

Go to `{{ user_editable_file }}` and uncomment the implementation for the `init`
command. Commit and push your changes to pass the first stage.

Time to move on to the next stage!
