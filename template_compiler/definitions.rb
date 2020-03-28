FM = FileMapping
Repo = StarterRepoDefinition

redis = Course.new(slug: "redis", name: "Redis")
docker = Course.new(slug: "docker", name: "Docker")

# TODO: Change py to "python"
python = Course.new(slug: "py", name: "Python")
go = Course.new(slug: "go", name: "Go")

DEFINITIONS = [
  Repo.new(
    course: redis,
    language: python,
    file_mappings: [
      FM.new("README.md", "redis/README.md"),
      FM.new("codecrafters.yml", "codecrafters.yml"),
      FM.new("app/main.py", "redis/python/app/main.py"),
      FM.new("spawn_redis_server.sh", "redis/python/spawn_redis_server.sh", is_executable=true),
    ],
    template_attrs: {
      "required_executable": "python (3.7)",
      "user_editable_file": "app/main.py"
    }
  ),
  Repo.new(
    course: redis,
    language: go,
    file_mappings: [
      FM.new("README.md", "redis/README.md"),
      FM.new("codecrafters.yml", "codecrafters.yml"),
      FM.new("app/server.go", "redis/go/app/server.go"),
      FM.new("spawn_redis_server.sh", "redis/go/spawn_redis_server.sh", is_executable=true),
    ],
    template_attrs: {
      "required_executable": "go (1.13)",
      "user_editable_file": "app/server.go"
    }
  )
]
