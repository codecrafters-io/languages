require "minitest/assertions"
require "colorize"

class BuildTester
  attr_reader :course, :language_pack

  def initialize(course, language_pack)
    @course = course
    @language_pack = language_pack
  end

  def test
    test_build && test_execute
  end

  def test_build
    slug = "redis-python-3.8"
    log_header("Testing #{course}-#{language_pack}")

    log_info "Building python image without cache"
    time_taken_without_cache = measure_time do
      `docker build -t #{slug} -f #{dockerfile_path} #{starter_dir}`
    end
    log_info "Took #{time_taken_without_cache} secs"
    log_info ""

    log_info "Building python image without cache"
    time_taken_with_cache = measure_time do
      `docker build -t #{slug} -f #{dockerfile_path} #{starter_dir}`
    end
    log_info "Took #{time_taken_with_cache} secs"
    log_info ""

    if time_taken_with_cache < 5
      log_success "Measured time is under threshold of 5 seconds"
      log_success ""
    else
      log_error "Measured time was above threshold of 5 seconds"
      log_error ""
      return false
    end

    true
  end

  def test_execute
    log_info "Executing starter repo script"
    output = nil
    time_taken = measure_time do
      output = `docker run -v #{File.expand_path(starter_dir)}:/app #{slug} /app/spawn_redis_server.sh`
    end

    if time_taken < 5
      log_success "Measured time is under threshold of 5 seconds"
      log_success ""
    else
      log_error "Measured time was above threshold of 5 seconds"
      log_error ""
      return false
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

    return true
  end

  def slug
    "#{course}-#{language_pack}"
  end

  def dockerfile_path
    "dockerfiles/#{course}/#{language_pack}.Dockerfile"
  end

  def starter_dir
    "compiled_starters/#{course}-starter-py"
  end

  def log_header(msg)
    puts msg.blue
    puts "-" * msg.length
  end

  def log_info(msg)
    puts "  " + msg.yellow
  end
  
  def log_error(msg)
    puts "  " + msg.red
  end

  def log_success(msg)
    puts "  " + msg.green
  end

  def measure_time
    before = Time.now
    yield
    after = Time.now
    after - before
  end
end

BuildTester.new("redis", "python-3.8").test
