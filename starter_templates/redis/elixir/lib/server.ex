defmodule Server do
  @moduledoc """
  Your implementation of a Redis server
  """

  use Application

  def start(_type, _args) do
    children = [
      Server.listen()
    ]

    opts = [strategy: :simple_one_for_one, name: Server.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @doc """
  Listen for incoming connections
  """
  def listen() do
    IO.puts("Your code goes here!")

    # Uncomment this block to pass the first stage
    #
    # {:ok, socket} = :gen_tcp.listen(6379, [:binary, active: false, reuseaddr: true])
    # {:ok, _client} = :gen_tcp.accept(socket)
  end
end
