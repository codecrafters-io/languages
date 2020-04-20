require "minitest/autorun"

require_relative "uncommenter"

SAMPLE_PY_COMMENTED = """
abcd = true

# Uncomment this to pass the first stage
#
# # This is an assignment
# a = b
#
# if True:
#     pass
#
# blah

yay = true
"""

SAMPLE_PY_UNCOMMENTED = """
abcd = true

# Uncomment this to pass the first stage

# This is an assignment
a = b

if True:
    pass

blah

yay = true
"""

SAMPLE_GO_COMMENTED = """
func main() {
  // Uncomment this to pass the first stage
  //
  // // This is an assignment
  // a := 1
  //
  // fmt.Println('hey')

  a := 2
}
"""

SAMPLE_GO_UNCOMMENTED = """
func main() {
  // Uncomment this to pass the first stage
  
  // This is an assignment
  a := 1
  
  fmt.Println('hey')

  a := 2
}
"""

UNCOMMENT_PATTERN = /Uncomment this/

class TestUncommenter < Minitest::Test
  def test_python
    actual = Uncommenter.new("python", SAMPLE_PY_COMMENTED, UNCOMMENT_PATTERN).uncommented
    expected = SAMPLE_PY_UNCOMMENTED
    assert_equal expected, actual
  end

  def test_complains_if_uncomment_marker_not_found
    assert_raises(UncommentMarkerNotFound) do
      Uncommenter.new("python", SAMPLE_PY_COMMENTED, /not found/).uncommented
    end
  end

  def test_twice_python
    actual = Uncommenter.new("python", SAMPLE_PY_UNCOMMENTED, UNCOMMENT_PATTERN).uncommented
    expected = SAMPLE_PY_UNCOMMENTED
    assert_equal expected, actual
  end

  def test_go
    actual = Uncommenter.new("go", SAMPLE_GO_COMMENTED, UNCOMMENT_PATTERN).uncommented
    expected = SAMPLE_GO_UNCOMMENTED
    assert_equal expected, actual
  end

  def test_twice_go
    actual = Uncommenter.new("go", SAMPLE_GO_UNCOMMENTED, UNCOMMENT_PATTERN).uncommented
    expected = SAMPLE_GO_UNCOMMENTED
    assert_equal expected, actual
  end
end
