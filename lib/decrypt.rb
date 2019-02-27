require './lib/runner'

if ARGV.length != 4 && ARGV.length != 3
  puts "Expected 4 arguments, received #{ARGV.length}"
  exit
end

Runner.start(ARGV)
