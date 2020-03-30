generate_toc:
	markdown-toc -i README.md

compile:
	bundle exec ruby template_compiler/compile.rb

test:
	bundle exec ruby tests/test_all.rb

test_redis:
	bundle exec ruby tests/test_all.rb redis

test_docker:
	bundle exec ruby tests/test_all.rb docker

test_redis_python:
	bundle exec ruby tests/test_all.rb redis python

sync_with_github: compile
	bundle exec ruby repo_syncer/sync.rb
