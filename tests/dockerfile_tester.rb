require_relative "logger"
require_relative "test_harness"

require "open3"

class DockerfileTester < TestHarness
  include Logger

  attr_reader :course, :language_pack

  def initialize(course, language_pack)
    @course = course
    @language_pack = language_pack
  end

  def self.from_dockerfile(dockerfile_path)
    dir, dockerfile_name = File.split(dockerfile_path)
    course = File.basename(dir)
    language_pack = dockerfile_name.sub(".Dockerfile", "")
    self.new(course, language_pack)
  end

  def language
    language_pack.split("-").first
  end

  def do_test
    log_header("Testing #{course}-#{language_pack}")

    log_info "Building #{language} image without cache"
    time_taken = assert_time_under(300) { build_image }

    log_info "Took #{time_taken} secs"
    log_info ""

    log_info "Building #{language} image without cache"
    assert_time_under(5) { build_image }

    log_info "Took #{time_taken} secs"
    log_info ""
  end

  def build_image
    assert_stdout_contains(
      "docker build -t #{slug} -f #{dockerfile_path} #{starter_dir}",
      "Successfully tagged #{slug}"
    )
  end

  def slug
    "#{course}-#{language_pack}"
  end

  def dockerfile_path
    "dockerfiles/#{course}/#{language_pack}.Dockerfile"
  end

  def starter_dir
    "compiled_starters/#{course}-starter-#{language}"
  end
end
