require "stringio"

class TestFailedError < StandardError
end

class MultiWriter
  def initialize(*targets)
    @targets = targets
  end

  def write(*args)
    @targets.map { |t| t.write(*args) }.first
  end

  def close
    @targets.each(&:close)
  end
end

class PrefixedLineWriter
  def initialize(prefix, target)
    @prefix = prefix
    @target = target
    @last_char = "\n"
  end

  def write(msg)
    bytes_written = 0
    msg.to_s.chars.each do |char| 
      @target.write(@prefix) if @last_char == "\n"
      bytes_written += @target.write(char)
      @last_char = char
    end
    bytes_written
  end

  def close; end
end

class TestHarness
  def test
    begin
      do_test
      true
    rescue TestFailedError
      false
    end
  end

  def assert_stdout_contains(command, expected_stdout, expected_exit_code=0)
    _, stdout_io, stderr_io, wait_thr = Open3.popen3(command)

    puts ""

    stdout_captured, stderr_captured = StringIO.new, StringIO.new
    setup_io_relay(stdout_io, $stdout, stdout_captured)
    setup_io_relay(stderr_io, $stderr, stderr_captured)

    exit_code = wait_thr.value.exitstatus
    stdout, stderr = stdout_captured.string, stderr_captured.string

    puts ""

    unless exit_code == expected_exit_code
      log_error("Process exited with code #{exit_code} (expected: #{expected_exit_code})")
      # log_error("Output: ")
      # log_error("")
      # log_plain_multiline(stdout) unless stdout.empty?
      # log_plain_multiline(stderr) unless stderr.empty?
      raise TestFailedError
    end

    unless stdout.include?(expected_stdout)
      log_error("Expected '#{expected_stdout}' to be present.")
      # log_error("Output found: ")
      # log_error("")
      # log_plain_multiline(stdout) unless stdout.empty?
      # log_plain_multiline(stderr) unless stderr.empty?
      raise TestFailedError
    end
  end

  def setup_io_relay(source, prefixed_destination, other_destination)
    IO.copy_stream(
      source,
      MultiWriter.new(
        PrefixedLineWriter.new("     ", prefixed_destination),
        other_destination
      )
    )
  end

  def assert(condition, message)
    unless condition
      log_error(message)
      raise TestFailedError
    end
  end

  def assert_time_under(threshold_seconds)
    before = Time.now
    yield
    after = Time.now
    time_taken = (after - before).round(1)

    if time_taken > threshold_seconds
      log_error "Measured time (#{time_taken}s) was above #{threshold_seconds} seconds"
      log_error ""
      raise TestFailedError
    end

    time_taken
  end
end
