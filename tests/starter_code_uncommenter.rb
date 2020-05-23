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
    raise "No code files found" if code_files.empty?
    code_files.map do |file_path| 
      old_contents = File.read(file_path)
      new_contents = Uncommenter.new(
        language,
        old_contents,
        UNCOMMENT_MARKER_PATTERN
      ).uncommented

      File.write(file_path, new_contents)
      post_processors.each { |post| post.call(file_path) }

      new_contents = File.read(file_path)
      Diffy::Diff.new(old_contents, new_contents)
    end
  end

  def post_processors
    {
      "go" => [
        Proc.new { |file_path|
          `goimports -w #{file_path}`
          if $? != 0
            raise RuntimeError.new("Running goimports failed")
          end
        },
      ]
    }.fetch(language, [])
  end

  def code_files
    Dir["#{dir}/**/*.#{code_file_extension}"]
  end

  def code_file_extension
    {
      "go" => "go",
      "python" => "py",
      "ruby" => "rb",
      "c" => "c",
      "rust" => "rs"
    }.fetch(language)
  end
end
