defmodule Server do
  @moduledoc """
  Module containing implementation for the redis server
  """

  @port Application.fetch_env!(:redis, :port)

  @doc """
  Function to start the server
  """
  def accept() do
    IO.puts("Your code goes here!")
    dummy_loop() # Remove this line
    # Uncomment this block to pass the first stage
    # {:ok, socket} = :gen_tcp.listen(@port, [:binary, active: false, reuseaddr: true])
    # accept_connection(socket)
  end

  # Uncomment this function as well to pass the first stage
  # defp accept_connection(socket) do
  #   accept_connection(socket)
  # end

  # Delete this function as well.
  def dummy_loop() do
    dummy_loop()
  end


end
