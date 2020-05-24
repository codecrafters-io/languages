require "octokit"
require "pry"

class RepoSyncer
  def initialize(github_client)
    @github_client = github_client
  end

  # Returns the URL to PR, or nil if none
  def sync(repo_name, directory)
    repo = find_or_create_repo(repo_name)
    master = @github_client.ref(repo.full_name, "heads/master")
    master_commit_sha = master.object.sha
    master_gh_commit = @github_client.commit(repo.full_name, master_commit_sha)
    master_tree_sha = master_gh_commit.commit.tree.sha

    commit_message = <<~EOF
      Syncing with codecrafters-io/languages

      Created by https://github.com/codecrafters-io/languages
    EOF

    gh_files = Dir
                 .glob("#{directory}/**/*")
                 .reject { |f| File.directory?(f) }
                 .map do |file|
                    {
                      path: Pathname.new(file).relative_path_from(Pathname.new(directory)),
                      mode: File.executable?(file) ? "100755" : "100644",
                      type: "blob",
                      content: File.read(file)
                    }
                 end
    tree = @github_client.create_tree(repo.full_name, gh_files)
    return if tree.sha == master_tree_sha

    commit = @github_client.create_commit(repo.full_name,
      commit_message,
      tree.sha,
      [master_commit_sha]
    )

    begin
      @github_client.delete_ref(repo.full_name, "heads/sync")
    rescue Octokit::UnprocessableEntity
    end

    @github_client.create_ref(repo.full_name, "heads/sync", commit.sha)
    pr = @github_client.create_pull_request(
      repo.full_name,
      "master",
      "sync",
      "Sync with languages repo",
      "This repository is maintained via https://github.com/codecrafters-io/languages"
    )
    pr.html_url
  end

  private

  def find_or_create_repo(repo_name)
    begin
      @github_client.repository("codecrafters-io/#{repo_name}")
    rescue Octokit::NotFound
      @github_client.create_repository(
        repo_name,
        organization: "codecrafters-io",
        auto_init: true # Need this to have a tree in place to create PR
      )
    end
  end
end

github_client = Octokit::Client.new(access_token: ENV.fetch("GITHUB_TOKEN"))

syncer = RepoSyncer.new(github_client)

Dir["compiled_starters/*"].each do |dir|
  repo_name = File.basename(dir)
  puts "Syncing #{repo_name}"
  pr_url = syncer.sync(repo_name, dir)
  if pr_url
    puts "PR: #{pr_url}"
    `open #{pr_url}`
  else
    puts "No changes"
  end
end
