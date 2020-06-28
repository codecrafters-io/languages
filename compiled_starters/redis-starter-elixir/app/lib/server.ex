defmodule Server do
  @moduledoc """
  Module containing implementation for the redis server
  """

  @port Application.fetch_env!(:app, :port)
  @doc """
  Function to start the server
  """
  def accept() do
    IO.puts("Your code goes here!")
    # Uncomment this block to pass the first stage
    # {:ok, socket} = :gen_tcp.listen(@port, [:binary, active: false, reuseaddr: true])
    # accept_connection(socket)
  end

  # Uncomment this function as well to pass the first stage
  #defp accept_connection(socket) do
  #  {:ok, _client} = :gen_tcp.accept(socket)
  #  accept_connection(socket)
  #end
end
