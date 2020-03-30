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
end
