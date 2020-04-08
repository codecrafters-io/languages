require "socket"

class YourRedisServer
  def initialize(port)
    @port = port
  end

  def start
    puts("Your code goes here!")

    # Uncomment this block to pass the first stage
    # server = TCPServer.new(@port)
    # client = server.accept
  end
end

YourRedisServer.new(6379).start
