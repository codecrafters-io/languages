require_relative "uncommenter"

class StarterCodeUncommenter
  attr_reader :dir, :language

  def initialize(dir, language)
    @dir = dir
    @language = language 
  end

  def uncomment
    code_files.each do |file_path| 
      contents = File.read(file_path)
      contents = Uncommenter.new(language, contents).uncommented
      File.write(file_path, contents)
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
