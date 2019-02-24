require './lib/runner'

if ARGV.length != 2
  puts "Expected 2 arguments, received #{ARGV.length}"
  exit
end

Runner.start(ARGV)
