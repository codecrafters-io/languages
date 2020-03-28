require "mustache"

class Course
  attr_reader :slug
  attr_reader :name

  def initialize(slug:, name:)
    @slug = slug
    @name = name
  end
end

class Language
  attr_reader :slug
  attr_reader :name

  def initialize(slug:, name:)
    @slug = slug
    @name = name
  end
end

class FileMapping
  attr_reader :destination_path
  attr_reader :source_template
  attr_reader :is_executable

  def initialize(destination_path, source_template, is_executable=false)
  end
end

class StarterRepoDefinition
  attr_reader :course
  attr_reader :language
  attr_reader :file_mappings
  attr_reader :template_attrs

  def initialize(course:, language:, file_mappings:)
    @course = course
    @language = language
    @file_mappings = file_mappings
  end

  def repo_name
    "#{course.slug}-starter-#{language.slug}"
  end

  def files
    @file_mappings.map do |mapping|
      template_contents = File.read(mapping.source_file)
      {
        path: mapping.destination_path,
        contents: Mustache.render(template_contents, template_context),
        is_executable: mapping.is_executable,
      }
    end
  end

  private

  def template_context
    {
      "language_name": @language.name,
      "language_slug": @language.slug,
      "course_name": @course.name,
      "course_slug": @course.name,
    }.merge(@template_attrs)
  end
end
