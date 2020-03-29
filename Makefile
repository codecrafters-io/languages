generate_toc:
	markdown-toc -i README.md

compile:
	bundle exec ruby template_compiler/compile.rb

test:
	bundle exec ruby tests/test_all.rb --verbose

sync_with_github: compile
	bundle exec ruby repo_syncer/sync.rb
