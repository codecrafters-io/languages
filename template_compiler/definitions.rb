FM = FileMapping
Repo = StarterRepoDefinition

redis = Course.new(slug: "redis", name: "Redis")
docker = Course.new(slug: "docker", name: "Docker")
git = Course.new(slug: "git", name: "Git")
sqlite = Course.new(slug: "sqlite", name: "SQLite")

c = Language.new(slug: "c", name: "C", repo_suffix: "c")
crystal = Language.new(slug: "crystal", name: "Crystal", repo_suffix: "crystal")
elixir = Language.new(slug: "elixir", name: "Elixir", repo_suffix: "elixir")
go = Language.new(slug: "go", name: "Go", repo_suffix: "go")
haskell = Language.new(slug: "haskell", name: "Haskell", repo_suffix: "haskell")
java = Language.new(slug: "java", name:"Java", repo_suffix: "java")
javascript = Language.new(slug: "javascript", name: "JavaScript", repo_suffix: "javascript")
kotlin = Language.new(slug: "kotlin", name: "Kotlin", repo_suffix: "kotlin")
nim = Language.new(slug: "nim", name: "Nim", repo_suffix: "nim")
php = Language.new(slug: "php", name: "PHP", repo_suffix: "php")
python = Language.new(slug: "python", name: "Python", repo_suffix: "python")
ruby = Language.new(slug: "ruby", name: "Ruby", repo_suffix: "ruby")
rust = Language.new(slug: "rust", name: "Rust", repo_suffix: "rust")

DEFINITIONS = [
  # ------------------- REDIS ------------------------------
  Repo.new(
    course: redis,
    language: crystal,
    file_mappings: [
      FM.new("README.md", "redis/README.md"),
      FM.new("codecrafters.yml", "codecrafters.yml"),
      FM.new("app/main.cr", "redis/crystal/app/main.cr"),
      FM.new("spawn_redis_server.sh", "redis/crystal/spawn_redis_server.sh", is_executable=true),
    ],
    template_attrs: {
      "required_executable": "crystal (1.1.0)",
      "user_editable_file": "app/main.cr"
    }
  ),
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
    language: java,
    file_mappings: [
      FM.new("README.md", "redis/README.md"),
      FM.new("codecrafters.yml", "codecrafters.yml"),
      FM.new(".gitignore", "redis/java/.gitignore"),
      FM.new("src/main/java/Main.java", "redis/java/src/main/java/Main.java"),
      FM.new("spawn_redis_server.sh", "redis/java/spawn_redis_server.sh", is_executable=true),
    ],
    template_attrs: {
      "required_executable": "java (1.8)",
      "user_editable_file": "Main.java"
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
  Repo.new(
    course: redis,
    language: rust,
    file_mappings: [
      FM.new("README.md", "redis/README.md"),
      FM.new("codecrafters.yml", "codecrafters.yml"),
      FM.new("src/main.rs", "redis/rust/src/main.rs"),
      FM.new(".gitignore", "redis/rust/.gitignore"),
      FM.new("Cargo.toml", "redis/rust/Cargo.toml"),
      FM.new("Cargo.lock", "redis/rust/Cargo.lock"),
      FM.new("spawn_redis_server.sh", "redis/rust/spawn_redis_server.sh", is_executable=true),
    ],
    template_attrs: {
      "required_executable": "cargo (1.43)",
      "user_editable_file": "src/main.rs"
    }
  ),
  Repo.new(
    course: redis,
    language: php,
    file_mappings: [
      FM.new("README.md", "redis/README.md"),
      FM.new("codecrafters.yml", "codecrafters.yml"),
      FM.new("app/main.php", "redis/php/app/main.php"),
      FM.new("spawn_redis_server.sh", "redis/php/spawn_redis_server.sh", is_executable=true),
    ],
    template_attrs: {
      "required_executable": "php (7.4)",
      "user_editable_file": "app/main.php"
    }
  ),
  Repo.new(
    course: redis,
    language: javascript,
    file_mappings: [
      FM.new("README.md", "redis/README.md"),
      FM.new("codecrafters.yml", "codecrafters.yml"),
      FM.new("app/main.js", "redis/javascript/app/main.js"),
      FM.new("spawn_redis_server.sh", "redis/javascript/spawn_redis_server.sh", is_executable=true),
    ],
    template_attrs: {
      "required_executable": "node (14)",
      "user_editable_file": "app/main.js"
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
  Repo.new(
    course: docker,
    language: php,
    file_mappings: [
      FM.new("README.md", "docker/README.md"),
      FM.new("codecrafters.yml", "codecrafters.yml"),
      FM.new("app/main.php", "docker/php/app/main.php"),
      FM.new("Dockerfile", "docker/php/Dockerfile"),
      FM.new("your_docker.sh", "docker/php/your_docker.sh", is_executable=true),
    ],
    template_attrs: {
      "required_executable": "php (7.4)",
      "user_editable_file": "app/main.php"
    }
  ),
  Repo.new(
    course: docker,
    language: nim,
    file_mappings: [
      FM.new("README.md", "docker/README.md"),
      FM.new("codecrafters.yml", "codecrafters.yml"),
      FM.new("app/main.nim", "docker/nim/app/main.nim"),
      FM.new("Dockerfile", "docker/nim/Dockerfile"),
      FM.new("your_docker.sh", "docker/nim/your_docker.sh", is_executable=true),
    ],
    template_attrs: {
      "required_executable": "nim (1.0)",
      "user_editable_file": "app/main.nim"
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
      FM.new(".gitignore", "git/rust/.gitignore"),
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
  ),

  # ------------------- SQLITE ------------------------------

  Repo.new(
    course: sqlite,
    language: python,
    file_mappings: [
      FM.new("README.md", "sqlite/README.md"),
      FM.new("codecrafters.yml", "codecrafters.yml"),
      FM.new("app/main.py", "sqlite/python/app/main.py"),
      FM.new("app/record_parser.py", "sqlite/python/app/record_parser.py"),
      FM.new("app/varint_parser.py", "sqlite/python/app/varint_parser.py"),
      FM.new("sample.db", "sqlite/sample.db"),
      FM.new("Pipfile", "sqlite/python/Pipfile"),
      FM.new("Pipfile.lock", "sqlite/python/Pipfile.lock"),
      FM.new(".gitignore", "sqlite/.gitignore"),
      FM.new("your_sqlite3.sh", "sqlite/python/your_sqlite3.sh", is_executable=true),
      FM.new("download_sample_databases.sh", "sqlite/download_sample_databases.sh", is_executable=true),
    ],
    template_attrs: {
      "required_executable": "python (3.8)",
      "user_editable_file": "app/main.py"
    }
  )
]
