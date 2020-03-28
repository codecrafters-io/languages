require_relative 'models'
require_relative 'definitions'
require "fileutils"

class TemplateCompiler
  def initialize(output_directory)
    @output_directory = output_directory
  end

  def compile_all
    DEFINITIONS.each { |d| compile_definition(d) }
  end

  private

  def compile_definition(definition)
    directory = File.join(@output_directory, definition.repo_name)
    definition.files.each do |file|
      path = File.join(directory, file[:path])
      FileUtils.mkdir_p(File.dirname(path))
      File.write(path, file[:contents])
      FileUtils.chmod(0755, path) if file[:is_executable]
    end
  end
end
