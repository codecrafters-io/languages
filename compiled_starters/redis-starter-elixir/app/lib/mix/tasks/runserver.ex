defmodule Mix.Tasks.Runserver do
  use Mix.Task

  @shortdoc "Simply calls the YourRedisServer.start() funciton"
  def run(_) do
    YourRedisServer.start()
  end
end
