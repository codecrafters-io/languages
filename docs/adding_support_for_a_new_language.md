# Adding support for a new language

To add support for a new language, you'll need to edit some files in this repository and 
send us a PR, like [this one](https://github.com/codecrafters-io/languages/pull/43). 

We have extensive CI tooling available that'll test your changes and make sure they're compatible. These
tests run when you open a PR.

Once you're PR is approved and merged, we'll then activate the language on [app.codecrafters.io](https://app.codecrafters.io/) 
instance for you to try out.

If you get stuck anywhere, feel free to ping @rohitpaulk in Discord! Use the `#contributors` 
channel.

### Ensure your language is compatible with the challenge

Some languages might not be compatible with certain challenges. 

In some cases an incompatibility is obvious. For example, you can't use Ruby for 
"Build your own React", since it requires compiling to Javascript. The only languages that
can be used for the React challenge are JavaScript, TypeScript, Elm, PureScript and the like.

In some other cases, it might not be so obvious. You can build Docker in PHP (and we support 
this), but we had to verify that all the required sys-calls are supported before adding 
support for this. Wherever possible, we add language-specific hints to stages to help 
users out.

### Add a test command

We'll start out by creating a quick make command you can run to test the starter implementation.

- Add a testing command to the Makefile, like `test_redis_go`. Check other examples to know what this should look
  like.

### Add a starter repository

- Go to `template_compiler/definitions.rb`, and add an entry for the new language + course. All 
  files are templatized, read through an existing definitions to understand how this works.
- Most of the files (like `.codecrafters.yml`, `README.md` etc.) shouldn't require any additional 
  changes. You'll only need to add files that are specific to your language. In most cases, you'll
  need to add: 
  - (1) A source code file, where the user will add code. Example: `app/server.py`. Just add a basic hello world for
    now, in the further steps we'll work on adding an implementation for the first stage of the challenge.
  - (2) An entry point bash script, this is what the tester program executes. Example: `your_git.sh`.
  - (3) Any dependency definition files, like `Pipfile`, or `package.json`.
- Once you've added these files, run `make compile` to see the compiled repository under `compiled_starters`.
  This is the content that end-users will see when they start the challenge.
  
### Add a Dockerfile

Now that you have a starter repository defined, let's work on a Dockerfile that'll tell CodeCrafters
how to build a container to run your starter code in.

- Add a dockerfile in the `dockerfiles/` directory. Check other examples to know what these should look like. 
- Run the testing command you added locally: `make test_redis_go` (substitute your language and challenge). This will
  test your starter template + dockerfile against the first stage of a challenge, and show you any errors encountered.
  
### Edit starter code

Edit your starter code to pass the testing command added above (`make test_<challenge>_<language>`).

The testing command checks whether your code fails the first stage, and then uncomments the implementation and checks if
it passes the first stage. Error messages should guide you through this process.

You might need to change the logic to uncomment code to handle your language. Again, the error messages should provide 
enough context here.

### Push to GitHub

Once you have the testing command working, push your code to GitHub. We'll run a series of automated tests, and someone
will help review and merge your PR!
