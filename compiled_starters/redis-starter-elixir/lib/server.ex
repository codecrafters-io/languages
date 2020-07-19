defmodule Server do
  @moduledoc """
  Module containing implementation for the redis server
  """

  use Application

  def start(_type, _args) do
    children = [
      Server.accept()
    ]

    opts = [strategy: :simple_one_for_one, name: Server.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @doc """
  Function to start the server
  """
  def accept() do
    IO.puts("Your code goes here!")
    socket = "dummy_val_remove_this_line"
    # Uncomment this block to pass the first stage
    #
    # {:ok, socket} = :gen_tcp.listen(6379, [:binary, active: false, reuseaddr: true])
    loop_acceptor(socket)
  end

  @doc """
  Loop to ensure the server can execute. 
  """
  def loop_acceptor(socket) do
    # Uncomment this block to pass the first stage
    #
    # {:ok, _client} = :gen_tcp.accept(socket)
    # :gen_tcp.recv(socket, 0)
    # Process.exit(self(), :kill) # To kill the process. Remove this line once you can read messages from sockets.
    loop_acceptor(socket)
  end
end
