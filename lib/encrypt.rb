if ARGV.length != 2
  puts "Expected 2 arguments, recieved #{ARGV.length}"
end


Runner.encrypt(ARGV)
