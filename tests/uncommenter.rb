class Uncommenter
  REGEX_PATTERNS = {
    "python" => /(^\s*)(#\s*)/,
    "go" => /(^\s*)(\/\/\s*)/
  }

  UNCOMMENT_PATTERN = /Uncomment this/

  attr_reader :language, :code

  def initialize(language, code)
    @language = language
    @code = code
  end

  def uncommented
    pattern = REGEX_PATTERNS.fetch(@language)

    code
      .lines
      .map { |line| line[..-2] }
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
    (uncomment_bounds[0] <= index) && (index <= uncomment_bounds[1])
  end

  def uncomment_bounds
    start_index = uncomment_line_index + 1
    end_index = start_index
    code.lines.each_with_index do |line, index| 
      next if index <= start_index

      break unless line_regex.match(line)

      end_index = index
    end

    [start_index, end_index]
  end

  def uncomment_line_index
    code
      .lines
      .index { |line| line_regex.match?(line) && UNCOMMENT_PATTERN.match?(line) }
  end

  def line_regex
    REGEX_PATTERNS.fetch(language)
  end
end
