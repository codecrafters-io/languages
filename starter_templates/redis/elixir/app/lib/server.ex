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
    # Uncomment this block to pass the first stage
    #
    # {:ok, socket} = :gen_tcp.listen(6379, [:binary, active: false, reuseaddr: true])
    dummy_loop()
  end

  @doc """
  Loop to ensure the server can execute. Delete this function once you have implemented the function to process
  input from the socket.
  """
  def dummy_loop() do
    dummy_loop()
  end
end
