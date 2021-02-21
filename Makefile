redis_tester_api_url = "https://api.github.com/repos/codecrafters-io/redis-starter-tester/releases/latest"
docker_tester_api_url = "https://api.github.com/repos/codecrafters-io/docker-starter-tester/releases/latest"
git_tester_api_url = "https://api.github.com/repos/codecrafters-io/git-starter-tester/releases/latest"

latest_redis_tester_version = $(shell curl $(redis_tester_api_url) | jq -r ".tag_name")
latest_docker_tester_version = $(shell curl $(docker_tester_api_url) | jq -r ".tag_name")
latest_git_tester_version = $(shell curl $(git_tester_api_url) | jq -r ".tag_name")

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

test_git_python: compile download_starter_testers
	bundle exec ruby tests/test_all.rb git python

test_git_ruby: compile download_starter_testers
	bundle exec ruby tests/test_all.rb git ruby

test_git_go: compile download_starter_testers
	bundle exec ruby tests/test_all.rb git go

test_git_rust: compile download_starter_testers
	bundle exec ruby tests/test_all.rb git rust

test_git_kotlin: compile download_starter_testers
	bundle exec ruby tests/test_all.rb git kotlin

test_git_haskell: compile download_starter_testers
	bundle exec ruby tests/test_all.rb git haskell

test_docker_go: compile download_starter_testers
	bundle exec ruby tests/test_all.rb docker go

test_docker_nim: compile download_starter_testers
	bundle exec ruby tests/test_all.rb docker nim

test_docker_c: compile download_starter_testers
	bundle exec ruby tests/test_all.rb docker c

test_docker_php: compile download_starter_testers
	bundle exec ruby tests/test_all.rb docker php

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

sync_with_github: compile
	bundle exec ruby repo_syncer/sync.rb

download_starter_testers:
	mkdir -p .starter_testers
	test -f .starter_testers/redis || make download_redis_starter_tester
	test -f .starter_testers/docker || make download_docker_starter_tester
	test -f .starter_testers/git || make download_git_starter_tester

download_redis_starter_tester:
	curl --fail -Lo .starter_testers/redis https://github.com/codecrafters-io/redis-starter-tester/releases/download/$(latest_redis_tester_version)/$(latest_redis_tester_version)_linux_amd64
	chmod +x ./.starter_testers/redis

download_docker_starter_tester:
	curl --fail -Lo .starter_testers/docker https://github.com/codecrafters-io/docker-starter-tester/releases/download/$(latest_docker_tester_version)/$(latest_docker_tester_version)_linux_amd64
	chmod +x ./.starter_testers/docker

download_git_starter_tester:
	curl --fail -Lo .starter_testers/git https://github.com/codecrafters-io/git-starter-tester/releases/download/$(latest_git_tester_version)/$(latest_git_tester_version)_linux_amd64
	chmod +x ./.starter_testers/git
