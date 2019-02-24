require './lib/runner'

if ARGV.length != 4
  puts "Expected 4 arguments, recieved #{ARGV.length}"
  exit
end

Runner.start(ARGV)
