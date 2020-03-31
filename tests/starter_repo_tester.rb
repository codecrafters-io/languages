require_relative "logger"

class StarterRepoTester < TestHarness
  include Logger

  attr_reader :course, :language

  def initialize(course, language)
    @course = course
    @language = language
  end

  def self.from_repo_name(repo_name)
    course, language = repo_name.split("-starter-")
    self.new(course, language)
  end

  def do_test
    log_header("Testing starter: #{course}-starter-#{language}")

    log_info "Building image"
    build_image

    log_info "Executing starter repo script"
    assert_time_under(5) {
      assert_script_output("Your code goes here", expected_exit_code=1)
    }

    log_success "Script output verified"
  end

  def starter_dir
    "compiled_starters/#{course}-starter-#{language}"
  end

  def dockerfile_path
    "dockerfiles/#{course}/#{language}-#{latest_version}"
  end

  def latest_dockerfile
    "#{course}-#{language}-#{latest_version}"
  end

  def latest_version
    dockerfiles = Dir["dockerfiles/#{course}/*.Dockerfile"]
    dockerfiles
      .map { |dockerfile_path| File.basename(dockerfile_path) }
      .map { |dockerfile_name| dockerfile_name.sub(".Dockerfile", "") }
      .select { |dockerfile_name| dockerfile_name.start_with?(language) }
      .map { |dockerfile_name| dockerfile_name.split("-").last }
      .sort_by { |version| Gem::Version.new(version) }
      .last
  end

  def slug
    "#{course}-#{language}-#{latest_version}"
  end

  def dockerfile_path
    "dockerfiles/#{course}/#{language}-#{latest_version}.Dockerfile" end

  def starter_dir
    "compiled_starters/#{course}-starter-#{language}"
  end

  def starter_tester_path
    ".starter_testers/#{course}"
  end

  def build_image
    assert_stdout_contains(
      "docker build -t #{slug} -f #{dockerfile_path} #{starter_dir}",
      "Successfully tagged #{slug}"
    )
  end

  def assert_script_output(expected_output, expected_exit_code=0)
    command = [
      "docker run",
      "-v #{File.expand_path(starter_dir)}:/app",
      "-v #{File.expand_path(starter_tester_path)}:/bin/tester",
      "#{slug} tester"
    ].join(" ")

    assert_stdout_contains(
      command,
      expected_output,
      expected_exit_code=expected_exit_code,
    )
  end
end
