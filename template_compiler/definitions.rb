FM = FileMapping
Repo = StarterRepoDefinition

redis = Course.new(slug: "redis", name: "Redis")
docker = Course.new(slug: "docker", name: "Docker")

python = Course.new(slug: "python", name: "Python")
go = Course.new(slug: "go", name: "Go")

DEFINITIONS = [
  Repo(
    course: redis,
    language: python,
    file_mappings: [
      FM("README.md", "redis/README.md"),
      FM("codecrafters.yml", "codecrafters.yml"),
      FM("app/main.py", "redis/python/app/main.py"),
      FM("spawn_redis_server.sh", "redis/python/spawn_redis_server.sh", is_executable=true),
    ]
  ),
  Repo(
    course: redis,
    language: go,
    file_mappings: [
      FM("README.md", "redis/README.md"),
      FM("codecrafters.yml", "codecrafters.yml"),
      FM("app/server.go", "redis/go/app/server.go"),
      FM("spawn_redis_server.sh", "redis/go/spawn_redis_server.sh", is_executable=true),
    ]
  )
]
