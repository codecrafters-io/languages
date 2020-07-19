FM = FileMapping
Repo = StarterRepoDefinition

redis = Course.new(slug: "redis", name: "Redis")
docker = Course.new(slug: "docker", name: "Docker")
git = Course.new(slug: "git", name: "Git")

python = Language.new(slug: "python", name: "Python", repo_suffix: "python")
go = Language.new(slug: "go", name: "Go", repo_suffix: "go")
c = Language.new(slug: "c", name: "C", repo_suffix: "c")
ruby = Language.new(slug: "ruby", name: "Ruby", repo_suffix: "ruby")
rust = Language.new(slug: "rust", name: "Rust", repo_suffix: "rust")
haskell = Language.new(slug: "haskell", name: "Haskell", repo_suffix: "haskell")
elixir = Language.new(slug: "elixir", name: "Elixir", repo_suffix: "elixir")
kotlin = Language.new(slug: "kotlin", name: "Kotlin", repo_suffix: "kotlin")

DEFINITIONS = [
  # ------------------- REDIS ------------------------------
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
      "required_executable": "python (3.8)",
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
  ),
  Repo.new(
    course: redis,
    language: c,
    file_mappings: [
      FM.new("README.md", "redis/README.md"),
      FM.new("codecrafters.yml", "codecrafters.yml"),
      FM.new("app/server.c", "redis/c/app/server.c"),
      FM.new("spawn_redis_server.sh", "redis/c/spawn_redis_server.sh", is_executable=true),
    ],
    template_attrs: {
      "required_executable": "gcc",
      "user_editable_file": "app/server.c"
    }
  ),
  Repo.new(
    course: redis,
    language: ruby,
    file_mappings: [
      FM.new("README.md", "redis/README.md"),
      FM.new("codecrafters.yml", "codecrafters.yml"),
      FM.new("app/server.rb", "redis/ruby/app/server.rb"),
      FM.new("spawn_redis_server.sh", "redis/ruby/spawn_redis_server.sh", is_executable=true),
    ],
    template_attrs: {
      "required_executable": "ruby (2.7)",
      "user_editable_file": "app/server.rb"
    }
  ),
  Repo.new(
    course: redis,
    language: haskell,
    file_mappings: [
      FM.new("README.md", "redis/README.md"),
      FM.new("codecrafters.yml", "codecrafters.yml"),
      FM.new("hs-redis-clone.cabal", "redis/haskell/hs-redis-clone.cabal"),
      FM.new(".gitignore", "redis/haskell/.gitignore"),
      FM.new("package.yaml", "redis/haskell/package.yaml"),
      FM.new("stack.yaml", "redis/haskell/stack.yaml"),
      FM.new("stack.yaml.lock", "redis/haskell/stack.yaml.lock"),
      FM.new("app/Main.hs", "redis/haskell/app/Main.hs"),
      FM.new("spawn_redis_server.sh", "redis/haskell/spawn_redis_server.sh", is_executable=true),
    ],
      template_attrs: {
        "required_executable": "stack",
        "user_editable_file": "Main.hs"
      }
  ),
  Repo.new(
    course: redis,
    language: elixir,
    file_mappings: [
      FM.new("README.md", "redis/README.md"),
      FM.new("codecrafters.yml", "codecrafters.yml"),
      FM.new("lib/server.ex", "redis/elixir/lib/server.ex"),
      FM.new("mix.exs", "redis/elixir/mix.exs"),
      FM.new("spawn_redis_server.sh", "redis/elixir/spawn_redis_server.sh", is_executable=true),
    ],
    template_attrs: {
      "required_executable": "mix",
      "user_editable_file": "lib/server.ex"
    }
  ),

  # ------------------- DOCKER ------------------------------

  Repo.new(
    course: docker,
    language: go,
    file_mappings: [
      FM.new("README.md", "docker/README.md"),
      FM.new("codecrafters.yml", "codecrafters.yml"),
      FM.new("app/main.go", "docker/go/app/main.go"),
      FM.new("Dockerfile", "docker/go/Dockerfile"),
      FM.new("your_docker.sh", "docker/go/your_docker.sh", is_executable=true),
    ],
    template_attrs: {
      "required_executable": "go",
      "user_editable_file": "app/main.go"
    }
  ),
  Repo.new(
    course: docker,
    language: c,
    file_mappings: [
      FM.new("README.md", "docker/README.md"),
      FM.new("codecrafters.yml", "codecrafters.yml"),
      FM.new("app/main.c", "docker/c/app/main.c"),
      FM.new("Dockerfile", "docker/c/Dockerfile"),
      FM.new("your_docker.sh", "docker/c/your_docker.sh", is_executable=true),
    ],
    template_attrs: {
      "required_executable": "gcc",
      "user_editable_file": "app/main.c"
    }
  ),

  # ------------------- GIT ------------------------------

  Repo.new(
    course: git,
    language: python,
    file_mappings: [
      FM.new("README.md", "git/README.md"),
      FM.new("codecrafters.yml", "codecrafters.yml"),
      FM.new("app/main.py", "git/python/app/main.py"),
      FM.new("your_git.sh", "git/python/your_git.sh", is_executable=true),
    ],
    template_attrs: {
      "required_executable": "python",
      "user_editable_file": "app/main.py"
    }
  ),
  Repo.new(
    course: git,
    language: ruby,
    file_mappings: [
      FM.new("README.md", "git/README.md"),
      FM.new("codecrafters.yml", "codecrafters.yml"),
      FM.new("app/main.rb", "git/ruby/app/main.rb"),
      FM.new("your_git.sh", "git/ruby/your_git.sh", is_executable=true),
    ],
    template_attrs: {
      "required_executable": "ruby",
      "user_editable_file": "app/main.rb"
    }
  ),
  Repo.new(
    course: git,
    language: go,
    file_mappings: [
      FM.new("README.md", "git/README.md"),
      FM.new("codecrafters.yml", "codecrafters.yml"),
      FM.new("app/main.go", "git/go/app/main.go"),
      FM.new("your_git.sh", "git/go/your_git.sh", is_executable=true),
    ],
    template_attrs: {
      "required_executable": "go",
      "user_editable_file": "app/main.go"
    }
  ),
  Repo.new(
    course: git,
    language: rust,
    file_mappings: [
      FM.new("README.md", "git/README.md"),
      FM.new("codecrafters.yml", "codecrafters.yml"),
      FM.new("src/main.rs", "git/rust/src/main.rs"),
      FM.new("Cargo.toml", "git/rust/Cargo.toml"),
      FM.new("Cargo.lock", "git/rust/Cargo.lock"),
      FM.new("your_git.sh", "git/rust/your_git.sh", is_executable=true),
    ],
    template_attrs: {
      "required_executable": "cargo (1.43)",
      "user_editable_file": "src/main.rs"
    }
  ),
  Repo.new(
    course: git,
    language: kotlin,
    file_mappings: [
      FM.new("README.md", "git/README.md"),
      FM.new("codecrafters.yml", "codecrafters.yml"),
      FM.new("app/main.kt", "git/kotlin/app/main.kt"),
      FM.new("your_git.sh", "git/kotlin/your_git.sh", is_executable=true),
    ],
    template_attrs: {
      "required_executable": "kotlin",
      "user_editable_file": "app/main.kt"
    }
  )

]
