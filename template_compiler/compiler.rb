require_relative 'models'
require_relative 'definitions'
require "fileutils"

class TemplateCompiler
  POSTPROCESSORS = {
    "md" => Proc.new { |filepath| `npx prettier --prose-wrap="always" --write #{filepath}` }
  }

  def initialize(templates_path, output_directory)
    @templates_path = templates_path
    @output_directory = output_directory
  end

  def compile_all
    Pathname.new(@output_directory).children.each { |p| p.rmtree }
    DEFINITIONS.each { |d| compile_definition(d) }
  end

  private

  def compile_definition(definition)
    directory = File.join(@output_directory, definition.repo_name)
    definition.files(@templates_path).each do |file|
      path = File.join(directory, file[:path])
      FileUtils.mkdir_p(File.dirname(path))
      File.write(path, file[:contents])
      FileUtils.chmod(0755, path) if file[:is_executable]
      postprocess!(path)
    end
  end

  def postprocess!(filepath)
    # TODO: Add others
    if filepath.end_with?(".md")
      POSTPROCESSORS["md"].call(filepath)
    end
  end
end
