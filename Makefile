redis_tester_api_url = "https://api.github.com/repos/codecrafters-io/redis-starter-tester/releases/latest"
docker_tester_api_url = "https://api.github.com/repos/codecrafters-io/docker-starter-tester/releases/latest"
git_tester_api_url = "https://api.github.com/repos/codecrafters-io/git-starter-tester/releases/latest"
sqlite_tester_api_url = "https://api.github.com/repos/codecrafters-io/sqlite-starter-tester/releases/latest"

latest_redis_tester_version = $(shell curl $(redis_tester_api_url) | jq -r ".tag_name")
latest_docker_tester_version = $(shell curl $(docker_tester_api_url) | jq -r ".tag_name")
latest_git_tester_version = $(shell curl $(git_tester_api_url) | jq -r ".tag_name")
latest_sqlite_tester_version = $(shell curl $(sqlite_tester_api_url) | jq -r ".tag_name")

generate_toc:
	markdown-toc -i README.md

compile:
	sudo rm -rf compiled_starters/*
	bundle exec ruby template_compiler/compile.rb

test: compile download_starter_testers
	bundle exec ruby tests/test_all.rb

test_redis: compile download_starter_testers
	bundle exec ruby tests/test_all.rb redis

test_docker: compile download_starter_testers
	bundle exec ruby tests/test_all.rb docker

test_git: compile download_starter_testers
	bundle exec ruby tests/test_all.rb git

test_sqlite: compile download_starter_testers
	bundle exec ruby tests/test_all.rb sqlite

test_git_python: download_starter_testers
	bundle exec ruby template_compiler/compile.rb git python
	bundle exec ruby tests/test_all.rb git python

test_git_ruby: download_starter_testers
	bundle exec ruby template_compiler/compile.rb git ruby
	bundle exec ruby tests/test_all.rb git ruby

test_git_go: download_starter_testers
	bundle exec ruby template_compiler/compile.rb git go
	bundle exec ruby tests/test_all.rb git go

test_git_rust: download_starter_testers
	bundle exec ruby template_compiler/compile.rb git rust
	bundle exec ruby tests/test_all.rb git rust

test_git_kotlin: download_starter_testers
	bundle exec ruby template_compiler/compile.rb git kotlin
	bundle exec ruby tests/test_all.rb git kotlin

test_docker_c: download_starter_testers
	bundle exec ruby template_compiler/compile.rb docker c
	bundle exec ruby tests/test_all.rb docker c

test_docker_go: download_starter_testers
	bundle exec ruby template_compiler/compile.rb docker go
	bundle exec ruby tests/test_all.rb docker go

test_docker_nim: download_starter_testers
	bundle exec ruby template_compiler/compile.rb docker nim
	bundle exec ruby tests/test_all.rb docker nim

test_docker_php: download_starter_testers
	bundle exec ruby template_compiler/compile.rb docker php
	bundle exec ruby tests/test_all.rb docker php

test_docker_rust: download_starter_testers
	bundle exec ruby template_compiler/compile.rb docker rust
	bundle exec ruby tests/test_all.rb docker rust

test_redis_crystal: compile download_starter_testers
	bundle exec ruby tests/test_all.rb redis crystal

test_redis_php: compile download_starter_testers
	bundle exec ruby tests/test_all.rb redis php

test_redis_python: compile download_starter_testers
	bundle exec ruby tests/test_all.rb redis python

test_redis_javascript: compile download_starter_testers
	bundle exec ruby tests/test_all.rb redis javascript

test_redis_ruby: compile download_starter_testers
	bundle exec ruby tests/test_all.rb redis ruby

test_redis_go: compile download_starter_testers
	bundle exec ruby tests/test_all.rb redis go

test_redis_c: compile download_starter_testers
	bundle exec ruby tests/test_all.rb redis c

test_redis_haskell: compile download_starter_testers
	bundle exec ruby tests/test_all.rb redis haskell

test_redis_java: compile download_starter_testers
	bundle exec ruby tests/test_all.rb redis java

test_redis_elixir: compile download_starter_testers
	bundle exec ruby tests/test_all.rb redis elixir

test_redis_rust: compile download_starter_testers
	bundle exec ruby tests/test_all.rb redis rust

test_sqlite_python: download_starter_testers
	bundle exec ruby template_compiler/compile.rb sqlite python
	bundle exec ruby tests/test_all.rb sqlite python

test_sqlite_go: download_starter_testers
	bundle exec ruby template_compiler/compile.rb sqlite go
	bundle exec ruby tests/test_all.rb sqlite go

test_sqlite_javascript: download_starter_testers
	bundle exec ruby template_compiler/compile.rb sqlite javascript
	bundle exec ruby tests/test_all.rb sqlite javascript

test_sqlite_rust: download_starter_testers
	bundle exec ruby template_compiler/compile.rb sqlite rust
	bundle exec ruby tests/test_all.rb sqlite rust

sync_with_github: compile
	bundle exec ruby repo_syncer/sync.rb

download_starter_testers:
	mkdir -p .starter_testers
	test -f .starter_testers/redis || make download_redis_starter_tester
	test -f .starter_testers/docker || make download_docker_starter_tester
	test -f .starter_testers/git || make download_git_starter_tester
	test -f .starter_testers/sqlite || make download_sqlite_starter_tester

download_redis_starter_tester:
	curl --fail -Lo .starter_testers/redis https://github.com/codecrafters-io/redis-starter-tester/releases/download/$(latest_redis_tester_version)/$(latest_redis_tester_version)_linux_amd64
	chmod +x ./.starter_testers/redis

download_docker_starter_tester:
	curl --fail -Lo .starter_testers/docker https://github.com/codecrafters-io/docker-starter-tester/releases/download/$(latest_docker_tester_version)/$(latest_docker_tester_version)_linux_amd64
	chmod +x ./.starter_testers/docker

download_git_starter_tester:
	curl --fail -Lo .starter_testers/git https://github.com/codecrafters-io/git-starter-tester/releases/download/$(latest_git_tester_version)/$(latest_git_tester_version)_linux_amd64
	chmod +x ./.starter_testers/git

download_sqlite_starter_tester:
	curl --fail -Lo .starter_testers/sqlite https://github.com/codecrafters-io/sqlite-starter-tester/releases/download/$(latest_sqlite_tester_version)/$(latest_sqlite_tester_version)_linux_amd64
	chmod +x ./.starter_testers/sqlite
