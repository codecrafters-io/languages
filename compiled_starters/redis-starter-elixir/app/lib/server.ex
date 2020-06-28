defmodule Server do
  require Logger

  @moduledoc """
  Module containing implementation for the redis server
  """

  @doc """
  Function to start the server
  """
  def accept(port \\ 6379) do
    IO.puts("Your code goes here!")
    # Uncomment this block to pass the first stage
    {:ok, socket} = :gen_tcp.listen(port, [:binary, active: false, reuseaddr: true])
    accept_connection(socket)
  end

  defp accept_connection(socket) do
    {:ok, _client} = :gen_tcp.accept(socket)
    accept_connection(socket)
  end
end
