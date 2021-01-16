class UncommentMarkerNotFound < Exception
  def initialize(code, marker_pattern)
    super <<~EOF
      Didn't find a line that matches #{marker_pattern.inspect} in file.
    EOF
  end
end

class Uncommenter
  POUND_SIGN = /(^\s*)(#\s{0,1})/
  DOUBLE_SLASHES = /(^\s*)(\/\/\s{0,1})/
  DOUBLE_HYPHENS = /(^\s*)(\-\-\s{0,1})/

  REGEX_PATTERNS = {
    "python" => POUND_SIGN,
    "ruby" => POUND_SIGN,
    "go" => DOUBLE_SLASHES,
    "c" => DOUBLE_SLASHES,
    "rust" => DOUBLE_SLASHES,
    "haskell" => DOUBLE_HYPHENS,
    "elixir" => POUND_SIGN,
    "kotlin" => DOUBLE_SLASHES,
    "javascript" => DOUBLE_SLASHES
  }

  attr_reader :language, :code, :uncomment_marker_pattern

  def initialize(language, code, uncomment_marker_pattern)
    @language = language
    @code = code
    @uncomment_marker_pattern = uncomment_marker_pattern
  end

  def uncommented

    raise UncommentMarkerNotFound.new(
      code,
      uncomment_marker_pattern
    ) unless !!uncomment_line_index

    pattern = REGEX_PATTERNS.fetch(@language)

    code
      .lines
      .map { |line| line[0..-2] }
      .each_with_index
      .map { |line, index|
        within_uncomment_bounds(index) ? uncomment_line(line) : line
      }
      .join("\n") + "\n"
  end

  def uncomment_line(line)
    matches = line.match(line_regex)
    line.sub(matches[2], "")
  end

  def within_uncomment_bounds(index)
    (index >= uncomment_bounds[0]) && (index <= uncomment_bounds[1])
  end

  def uncomment_bounds
    start_index = uncomment_line_index + 1
    end_index = start_index - 1
    code.lines.each_with_index do |line, index|
      next if index < start_index

      unless !!line_regex.match(line)
        break
      end

      end_index = index
    end

    [start_index, end_index]
  end

  def uncomment_line_index
    code
      .lines
      .index { |line| line_regex.match?(line) && uncomment_marker_pattern.match?(line) }
  end

  def line_regex
    REGEX_PATTERNS.fetch(language)
  end
end
