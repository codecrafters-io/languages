generate_toc:
	markdown-toc -i README.md

compile:
	bundle exec ruby template_compiler/compile.rb

sync:
	bundle exec ruby repo_syncer/sync.rb
