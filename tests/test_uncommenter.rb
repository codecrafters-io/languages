require "minitest/autorun"

require_relative "uncommenter"

SAMPLE_PY_COMMENTED = """
abcd = true

# Uncomment this to pass the first stage
#
# # This is an assignment
# a = b
#
# blah

yay = true
"""

SAMPLE_PY_UNCOMMENTED = """
abcd = true

# Uncomment this to pass the first stage

# This is an assignment
a = b

blah

yay = true
"""

class TestUncommenter < Minitest::Test
  def test_python
    actual = Uncommenter.new("python", SAMPLE_PY_COMMENTED).uncommented
    expected = SAMPLE_PY_UNCOMMENTED
    assert_equal expected, actual
  end

  def test_uncomment_twice
    actual = Uncommenter.new("python", SAMPLE_PY_UNCOMMENTED).uncommented
    expected = SAMPLE_PY_UNCOMMENTED
    assert_equal expected, actual
  end
end
