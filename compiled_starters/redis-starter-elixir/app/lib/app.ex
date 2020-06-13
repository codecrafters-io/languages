defmodule YourRedisServer do
  @moduledoc """
  Module containing implementation for the redis server
  """

  @doc """
  Function to start the server
  """
  @spec start(integer()) :: no_return()
  def start(port \\ 6379) do
    IO.puts("Your code goes here!")

    # Uncomment this block to pass the first stage
    # server = TCPServer.new(@port)
    # client = server.accept
  end
end
