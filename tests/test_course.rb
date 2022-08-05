# Usage: ruby tests/test_course.rb [course_filter] [language_filter]
#
ENV["DOCKER_BUILDKIT"] = "0"

require_relative "dockerfile_tester"
require_relative "starter_repo_tester"

DOCKERFILE_PATHS_TO_SKIP = [
  "dockerfiles/redis/elixir-1.10.Dockerfile", # Temporarily disabled, fails tests (hits timeout)
  "dockerfiles/sqlite/rust-1.43.Dockerfile", # Newer dependencies aren't compatible
  "dockerfiles/redis/haskell-8.8.Dockerfile", # Newer dependencies aren't compatible
]

course_filter = ARGV[0]
language_filter = ARGV[1]

dockerfile_testers = Dir["dockerfiles/**/*.Dockerfile"].map do |path|
  next if DOCKERFILE_PATHS_TO_SKIP.include?(path)
  DockerfileTester.from_dockerfile(path)
end.compact

starter_repo_testers = Dir["compiled_starters/*"].map do |compiled_starter_path|
  repo_name = File.basename(compiled_starter_path)
  StarterRepoTester.from_repo_name(repo_name)
end

testers = dockerfile_testers + starter_repo_testers

puts "Found #{testers.count} tests"

if course_filter
  puts "Filtering by course:#{course_filter}"
  testers = testers.select { |tester| tester.course == course_filter }
end

if language_filter
  puts "Filtering by language:#{language_filter}"
  testers = testers.select { |tester| tester.language == language_filter }
end

if testers.empty?
  puts "No tests found!"
  exit 1
end

testers.each { |tester| tester.test || exit(1) }
