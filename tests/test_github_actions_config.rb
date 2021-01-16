require "minitest/autorun"
require "yaml"

class TestGithubActionsConfig < Minitest::Test
  def test_python
    yaml = YAML.load_file(".github/workflows/test.yml")

    actual_combinations = yaml["jobs"]["test_starter_code"]["strategy"]["matrix"]["include"]

    expected_combinations = Dir["compiled_starters/*"].map { |directory_path|
      directory_name = File.basename(directory_path)
      challenge, language = directory_name.split("-starter-")

      {
        "challenge" => challenge,
        "language" => language
      }
    }
    challenges = expected_combinations.map { |combination| combination["challenge"] }.uniq

    challenges.each do |challenge|
      expected_languages = expected_combinations
        .select { |combination| combination["challenge"] == challenge }
        .map { |combination| combination["language"] }

      actual_languages = actual_combinations
        .select { |combination| combination["challenge"] == challenge }
        .map { |combination| combination["language"] }

      assert_equal expected_languages, actual_languages, "Expected all languages for #{challenge} to be tested"
    end
  end
end
