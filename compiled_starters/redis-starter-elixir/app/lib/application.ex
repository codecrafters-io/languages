defmodule YourRedisServer.Application do
  use Application

  def start(_type, _args) do
    children = [
      YourRedisServer.accept()
    ]

    opts = [strategy: :one_for_one, name: YourRedisServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
