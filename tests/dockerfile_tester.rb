require_relative "logger"
require_relative "test_harness"

require "open3"

class DockerfileTester < TestHarness
  include Logger

  attr_reader :course, :language_pack

  def initialize(course, language_pack)
    @course = course
    @language_pack = language_pack
  end

  def self.from_dockerfile(dockerfile_path)
    dir, dockerfile_name = File.split(dockerfile_path)
    course = File.basename(dir)
    language_pack = dockerfile_name.sub(".Dockerfile", "")
    self.new(course, language_pack)
  end

  def language
    language_pack.split("-").first
  end

  def do_test
    log_header("Testing #{course}-#{language_pack}")

    log_info "Building #{language} image without cache"

    time_taken_without_cache = measure_time { build_image }

    log_info "Took #{time_taken_without_cache} secs"
    log_info ""

    log_info "Building #{language} image without cache"

    time_taken_with_cache = measure_time { build_image }

    log_info "Took #{time_taken_with_cache} secs"
    log_info ""

    if time_taken_with_cache < 5
      log_success "Measured time is under threshold of 5 seconds"
      log_success ""
    else
      log_error "Measured time was above threshold of 5 seconds"
      log_error ""
      raise TestFailedError
    end
  end

  def build_image
    _, stdout_io, stderr_io, wait_thr = process = Open3.popen3(
      "docker build -t #{slug} -f #{dockerfile_path} #{starter_dir}"
    )
    exit_code = wait_thr.value.to_i
    stdout, stderr = stdout_io.read, stderr_io.read

    unless exit_code == 0
      log_error("Build exited with code #{exit_code}")
      log_error(stdout) unless stdout.empty?
      log_error(stderr) unless stderr.empty?
      raise TestFailedError
    end

    unless stdout.include?("Successfully tagged #{slug}")
      log_error("Expected 'Successfully tagged #{slug}' to be present.")

      log_error("Build exited with code #{exit_code}")
      log_error(stdout)
      log_error(stderr)
      raise TestFailedError
    end
  end

  def slug
    "#{course}-#{language_pack}"
  end

  def dockerfile_path
    "dockerfiles/#{course}/#{language_pack}.Dockerfile"
  end

  def starter_dir
    "compiled_starters/#{course}-starter-#{language}"
  end

  def measure_time
    before = Time.now
    yield
    after = Time.now
    after - before
  end
end
