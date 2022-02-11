# You can use print statements as follows for debugging, they'll be visible when running tests.
puts "Logs from your program will appear here!"

# Uncomment this block to pass the first stage
#
# command = ARGV[0]
# case command
# when "init"
#   Dir.mkdir(".git")
#   Dir.mkdir(".git/objects")
#   Dir.mkdir(".git/refs")
#   File.write(".git/HEAD", "ref: refs/heads/master\n")
#   puts "Initialized git directory"
# else
#   raise RuntimeError.new("Unknown command #{command}")
# end
