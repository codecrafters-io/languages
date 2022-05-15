redis_tester_api_url = "https://api.github.com/repos/codecrafters-io/redis-starter-tester/releases/latest"
docker_tester_api_url = "https://api.github.com/repos/codecrafters-io/docker-starter-tester/releases/latest"
git_tester_api_url = "https://api.github.com/repos/codecrafters-io/git-starter-tester/releases/latest"
react_tester_api_url = "https://api.github.com/repos/codecrafters-io/react-starter-tester/releases/latest"
sqlite_tester_api_url = "https://api.github.com/repos/codecrafters-io/sqlite-starter-tester/releases/latest"

latest_redis_tester_version = $(shell curl $(redis_tester_api_url) | jq -r ".tag_name")
latest_docker_tester_version = $(shell curl $(docker_tester_api_url) | jq -r ".tag_name")
latest_git_tester_version = $(shell curl $(git_tester_api_url) | jq -r ".tag_name")
latest_react_tester_version = $(shell curl $(react_tester_api_url) | jq -r ".tag_name")
latest_sqlite_tester_version = $(shell curl $(sqlite_tester_api_url) | jq -r ".tag_name")

generate_toc:
	markdown-toc -i README.md

compile:
	sudo rm -rf compiled_starters/*
	bundle exec ruby template_compiler/compile.rb

test: compile download_starter_testers
	bundle exec ruby tests/test_course.rb

test_redis: compile download_starter_testers
	bundle exec ruby tests/test_course.rb redis

test_docker: compile download_starter_testers
	bundle exec ruby tests/test_course.rb docker

test_git: compile download_starter_testers
	bundle exec ruby tests/test_course.rb git

test_sqlite: compile download_starter_testers
	bundle exec ruby tests/test_course.rb sqlite

test_git_python: download_starter_testers
	bundle exec ruby template_compiler/compile.rb git python
	bundle exec ruby tests/test_course.rb git python

test_git_ruby: download_starter_testers
	bundle exec ruby template_compiler/compile.rb git ruby
	bundle exec ruby tests/test_course.rb git ruby

test_git_go: download_starter_testers
	bundle exec ruby template_compiler/compile.rb git go
	bundle exec ruby tests/test_course.rb git go

test_git_rust: download_starter_testers
	bundle exec ruby template_compiler/compile.rb git rust
	bundle exec ruby tests/test_course.rb git rust

test_git_kotlin: download_starter_testers
	bundle exec ruby template_compiler/compile.rb git kotlin
	bundle exec ruby tests/test_course.rb git kotlin

test_docker_c: download_starter_testers
	bundle exec ruby template_compiler/compile.rb docker c
	bundle exec ruby tests/test_course.rb docker c

test_docker_go: download_starter_testers
	bundle exec ruby template_compiler/compile.rb docker go
	bundle exec ruby tests/test_course.rb docker go

test_docker_nim: download_starter_testers
	bundle exec ruby template_compiler/compile.rb docker nim
	bundle exec ruby tests/test_course.rb docker nim

test_docker_php: download_starter_testers
	bundle exec ruby template_compiler/compile.rb docker php
	bundle exec ruby tests/test_course.rb docker php

test_react: download_starter_testers
	bundle exec ruby template_compiler/compile.rb react
	bundle exec ruby tests/test_course.rb react

test_docker_rust: download_starter_testers
	bundle exec ruby template_compiler/compile.rb docker rust
	bundle exec ruby tests/test_course.rb docker rust

test_redis_clojure: download_starter_testers
	bundle exec ruby template_compiler/compile.rb redis clojure
	bundle exec ruby tests/test_course.rb redis clojure

test_redis_crystal: download_starter_testers
	bundle exec ruby template_compiler/compile.rb redis crystal
	bundle exec ruby tests/test_course.rb redis crystal

test_redis_csharp: download_starter_testers
	bundle exec ruby template_compiler/compile.rb redis csharp
	bundle exec ruby tests/test_course.rb redis csharp

test_redis_php: download_starter_testers
	bundle exec ruby template_compiler/compile.rb redis php
	bundle exec ruby tests/test_course.rb redis php

test_redis_python: download_starter_testers
	bundle exec ruby template_compiler/compile.rb redis python
	bundle exec ruby tests/test_course.rb redis python

test_redis_javascript: download_starter_testers
	bundle exec ruby template_compiler/compile.rb redis javascript
	bundle exec ruby tests/test_course.rb redis javascript

test_redis_ruby: download_starter_testers
	bundle exec ruby template_compiler/compile.rb redis ruby
	bundle exec ruby tests/test_course.rb redis ruby

test_redis_go: download_starter_testers
	bundle exec ruby template_compiler/compile.rb redis go
	bundle exec ruby tests/test_course.rb redis go

test_redis_c: download_starter_testers
	bundle exec ruby template_compiler/compile.rb redis c
	bundle exec ruby tests/test_course.rb redis c

test_redis_haskell: download_starter_testers
	bundle exec ruby template_compiler/compile.rb redis haskell
	bundle exec ruby tests/test_course.rb redis haskell

test_redis_java: download_starter_testers
	bundle exec ruby template_compiler/compile.rb redis java
	bundle exec ruby tests/test_course.rb redis java

test_redis_elixir: download_starter_testers
	bundle exec ruby template_compiler/compile.rb redis elixir
	bundle exec ruby tests/test_course.rb redis elixir

test_redis_rust: download_starter_testers
	bundle exec ruby template_compiler/compile.rb redis rust
	bundle exec ruby tests/test_course.rb redis rust

test_redis_kotlin: download_starter_testers
	bundle exec ruby template_compiler/compile.rb redis kotlin
	bundle exec ruby tests/test_course.rb redis kotlin

test_sqlite_python: download_starter_testers
	bundle exec ruby template_compiler/compile.rb sqlite python
	bundle exec ruby tests/test_course.rb sqlite python

test_sqlite_go: download_starter_testers
	bundle exec ruby template_compiler/compile.rb sqlite go
	bundle exec ruby tests/test_course.rb sqlite go

test_sqlite_javascript: download_starter_testers
	bundle exec ruby template_compiler/compile.rb sqlite javascript
	bundle exec ruby tests/test_course.rb sqlite javascript

test_sqlite_rust: download_starter_testers
	bundle exec ruby template_compiler/compile.rb sqlite rust
	bundle exec ruby tests/test_course.rb sqlite rust

sync_with_github: compile
	bundle exec ruby repo_syncer/sync.rb

download_starter_testers:
	mkdir -p .starter_testers
	test -d .starter_testers/docker || make download_docker_starter_tester
	test -d .starter_testers/git || make download_git_starter_tester
	test -d .starter_testers/react || make download_react_starter_tester
	test -d .starter_testers/redis || make download_redis_starter_tester
	test -d .starter_testers/sqlite || make download_sqlite_starter_tester

download_redis_starter_tester:
	curl --fail -Lo .starter_testers/redis.tar.gz https://github.com/codecrafters-io/redis-starter-tester/releases/download/$(latest_redis_tester_version)/$(latest_redis_tester_version)_linux_amd64.tar.gz
	mkdir .starter_testers/redis
	tar xf .starter_testers/redis.tar.gz -C .starter_testers/redis
	rm .starter_testers/redis.tar.gz

download_docker_starter_tester:
	curl --fail -Lo .starter_testers/docker.tar.gz https://github.com/codecrafters-io/docker-starter-tester/releases/download/$(latest_docker_tester_version)/$(latest_docker_tester_version)_linux_amd64.tar.gz
	mkdir .starter_testers/docker
	tar xf .starter_testers/docker.tar.gz -C .starter_testers/docker
	rm .starter_testers/docker.tar.gz

download_git_starter_tester:
	curl --fail -Lo .starter_testers/git.tar.gz https://github.com/codecrafters-io/git-starter-tester/releases/download/$(latest_git_tester_version)/$(latest_git_tester_version)_linux_amd64.tar.gz
	mkdir .starter_testers/git
	tar xf .starter_testers/git.tar.gz -C .starter_testers/git
	rm .starter_testers/git.tar.gz

download_react_starter_tester:
	curl --fail -Lo .starter_testers/react.tar.gz https://github.com/codecrafters-io/react-starter-tester/releases/download/$(latest_react_tester_version)/$(latest_react_tester_version)_linux_amd64.tar.gz
	mkdir .starter_testers/react
	tar xf .starter_testers/react.tar.gz -C .starter_testers/react
	rm .starter_testers/react.tar.gz

download_sqlite_starter_tester:
	curl --fail -Lo .starter_testers/sqlite.tar.gz https://github.com/codecrafters-io/sqlite-starter-tester/releases/download/$(latest_sqlite_tester_version)/$(latest_sqlite_tester_version)_linux_amd64.tar.gz
	mkdir .starter_testers/sqlite
	tar xf .starter_testers/sqlite.tar.gz -C .starter_testers/sqlite
	rm .starter_testers/sqlite.tar.gz
