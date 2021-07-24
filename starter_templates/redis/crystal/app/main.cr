require "socket"

class YourRedisServer
  def start
    puts("Your code goes here!")

    # Uncomment this block to pass the first stage
    # server = TCPServer.new("localhost", 6379, reuse_port: true)
    # client = server.accept?
  end
end

YourRedisServer.new.start
