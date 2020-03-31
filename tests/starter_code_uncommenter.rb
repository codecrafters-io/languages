require_relative "uncommenter"
require "diffy"

class StarterCodeUncommenter
  attr_reader :dir, :language

  UNCOMMENT_MARKER_PATTERN = /Uncomment this/

  def initialize(dir, language)
    @dir = dir
    @language = language 
  end

  def uncomment
    code_files.map do |file_path| 
      old_contents = File.read(file_path)
      new_contents = Uncommenter.new(
        language,
        old_contents,
        UNCOMMENT_MARKER_PATTERN
      ).uncommented

      File.write(file_path, new_contents)

      Diffy::Diff.new(old_contents, new_contents)
    end
  end

  def code_files
    Dir["#{dir}/app/*.#{code_file_extension}"]
  end

  def code_file_extension
    {
      "go" => "go",
      "python" => "py"
    }.fetch(language)
  end
end
