This is a starting point for {{language_name}} solutions to the
["Build Your Own Redis" Challenge](https://codecrafters.io/challenges/redis).

In this challenge, you'll build a toy Redis clone that's capable of handling
basic commands like `PING`, `SET` and `GET`. Along the way we'll learn about
event loops, the Redis protocol and more. 

**Note**: If you're viewing this repo on GitHub, head over to
[codecrafters.io](https://codecrafters.io) to signup for early access.

# Usage

1. Ensure you have `{{ required_executable }}` installed locally
1. Run `./spawn_redis_server.sh` to run your Redis server, which is implemented in
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

You should see a failure message that says it wasn't able to connect to port
`6379`.

Go to `{{ user_editable_file }}` and uncomment the server implementation. Commit and
push your changes, and you'll now see the first stage pass.

Time to move on to the next stage!

{{#language_is_python}}

# Troubleshooting

### module `socket` has not attribute `create_server`

When running your server locally, you might see an error like this: 

```
Traceback (most recent call last):
  File "/usr/local/lib/pyenv/versions/3.7.3/lib/python3.7/runpy.py", line 193, in _run_module_as_main
    "__main__", mod_spec)
  File "/usr/local/lib/pyenv/versions/3.7.3/lib/python3.7/runpy.py", line 85, in _run_code
    exec(code, run_globals)
  File "/app/app/main.py", line 11, in <module>
    main()
  File "/app/app/main.py", line 6, in main
    s = socket.create_server(("localhost", 6379), reuse_port=True)
AttributeError: module 'socket' has no attribute 'create_server'
```

This is because `socket.create_server` was introduced in Python 3.8, and you
might be running an older version. 

You can fix this by installing Python 3.8 locally and using that. 

If you'd like to use a different version of Python, change the `language_pack`
value in `codecrafters.yml`.
{{/language_is_python}}
