require "pry"

require_relative "dockerfile_tester"
require_relative "starter_repo_tester"

dockerfile_testers = Dir["dockerfiles/**/*.Dockerfile"].map do |path| 
  DockerfileTester.from_dockerfile(path)
end

starter_repo_testers = Dir["compiled_starters/*"].map do |compiled_starter_path| 
  repo_name = File.basename(compiled_starter_path)
end

testers = dockerfile_testers

results = testers.map(&:test)

# results = [
#   DockerfileTester.new("redis", "python-3.8").test,
#   StarterRepoTester.new("redis", "python").test
# ]

exit results.all?(true) ? 0 : 1
