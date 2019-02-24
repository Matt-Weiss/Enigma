require './test/test_helper'

class RunnerTest < Minitest::Test

  def test_it_exists
    runner = Runner.new
    assert_instance_of Runner, runner
  end

end
