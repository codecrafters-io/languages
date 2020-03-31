class TestFailedError < StandardError
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
    _, stdout_io, stderr_io, wait_thr = process = Open3.popen3(command)
    exit_code = wait_thr.value.exitstatus
    stdout, stderr = stdout_io.read, stderr_io.read

    unless exit_code == expected_exit_code
      log_error("Process exited with code #{exit_code} (expected: #{expected_exit_code})")
      log_error("Output: ")
      log_error("")
      log_plain_multiline(stdout) unless stdout.empty?
      log_plain_multiline(stderr) unless stderr.empty?
      raise TestFailedError
    end

    unless stdout.include?(expected_stdout)
      log_error("Expected '#{expected_stdout}' to be present.")
      log_error("Output found: ")
      log_error("")
      log_plain_multiline(stdout) unless stdout.empty?
      log_plain_multiline(stderr) unless stderr.empty?
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
