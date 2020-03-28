require "octokit"
require "pry"

class RepoSyncer
  def initialize(github_client)
    @github_client = github_client
  end

  def sync(repo_name, directory)
    repo = find_or_create_repo(repo_name)
    master = @github_client.ref(repo.full_name, "heads/master")
    master_commit_sha = master.object.sha
    master_gh_commit = @github_client.ref(repo.full_name, master_commit_sha)
    master_tree_sha = master_gh_commit.commit.tree.sha

    commit_message = <<~EOF
      Syncing with codecrafters-io/languages

      Created by https://github.com/codecrafters-io/languages
    EOF

    gh_files = Dir.glob("#{directory}/**/*").map do |file|
      {
        path: file,
        mode: file.is_executable ? "100755" : "100644",
        type: "blob",
        content: File.read(File.join(directory, file))
      }
    end
    tree = @github_client.create_tree(repo.full_name, gh_files)
    return if tree.sha == master_tree_sha

    binding.pry
  end

  private

  def find_or_create_repo(repo_name)
    @github_client.repository("codecrafters-io/#{repo_name}")
  end
end

github_client = Octokit::Client.new(access_token: ENV.fetch("GITHUB_TOKEN"))

syncer = RepoSyncer.new(github_client)

Dir["compiled_starters/*"].each do |dir|
  repo_name = File.basename(dir)
  puts "Syncing #{repo_name}"
  syncer.sync(repo_name, dir)
end
