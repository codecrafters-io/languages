require "minitest/autorun"
require "minitest/color"

require "yaml"

class TestGitHubActionsMatrix < Minitest::Test
  def test_combinations
    courses = Dir["compiled_starters/*"].map { |f| File.basename(f).split("-").first }.uniq

    courses.each do |course|
      github_actions_configuration = YAML.load_file(".github/workflows/test.yml")
      actual_languages = github_actions_configuration["jobs"][course]["strategy"]["matrix"]["language"]

      expected_languages = [
        *(Dir["dockerfiles/#{course}/*.Dockerfile"].map { |dockerfile_path| File.basename(dockerfile_path).split("-").first }),
        *(Dir["compiled_starters/#{course}-*"].map { |starter_dir| File.basename(starter_dir).split("-").last }),
      ].uniq

      if expected_languages.include?("nodejs")
        expected_languages = expected_languages - ["nodejs"]
        expected_languages << "javascript" unless expected_languages.include?("javascript")
      end

      assert_equal(expected_languages.sort, actual_languages.sort, "add missing languages for #{course} to jobs.#{course}.matrix.language in .github/workflows/test.yml")
    end
  end
end
