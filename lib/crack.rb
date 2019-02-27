require './lib/runner'

if ARGV.length != 2 && ARGV.length != 3
  puts "Expected 2-3 arguments, received #{ARGV.length}"
  exit
end

Runner.start(ARGV)
