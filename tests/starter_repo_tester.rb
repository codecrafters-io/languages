require_relative "logger"

class StarterRepoTester
  include Logger

  attr_reader :course, :language

  def initialize(course, language)
    @course = course
    @language = language
  end

  def self.from_repo_name(repo_name)
  end

  def test
    log_header("Testing #{course}-starter-#{language}")

    log_info "Building image"
    build_image

    log_info "Executing starter repo script"

    output = nil
    time_taken = measure_time do
      output = run_script
    end


    if output.include?("Implement your Redis server here")
      log_success "Output matched expected"
      log_success ""
    else
      log_error "Output did not contain expected value"
      log_error "Output: #{output}"
      log_error ""
      return false
    end

    if time_taken < 5
      log_success "Measured time is under threshold of 5 seconds"
      log_success ""
    else
      log_error "Measured time was above threshold of 5 seconds"
      log_error ""
      return false
    end

    return true
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
    "compiled_starters/#{course}-starter-py"
  end

  def measure_time
    before = Time.now
    yield
    after = Time.now
    after - before
  end

  def build_image
    process = IO.popen(
      "docker build -t #{slug} -f #{dockerfile_path} #{starter_dir}"
    )
    output = process.read
    unless output.include?("Successfully tagged #{slug}")
      raise RuntimeError.new <<~EOF
        Build failed. Output:

        #{output}
      EOF
    end
  end

  def run_script
    command = [
      "docker run",
      "-v #{File.expand_path(starter_dir)}:/app",
      "#{slug} /app/spawn_redis_server.sh"
    ].join(" ")
    `#{command}`
  end
end
