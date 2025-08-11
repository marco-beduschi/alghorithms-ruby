require 'minitest/autorun'
require_relative '../two_cristal_balls'

class TwoCrystalBallsTest < Minitest::Test
  def test_two_crystal_balls
    idx = rand(10000)
    data = Array.new(10000, false)

    (idx...10000).each do |i|
      data[i] = true
    end

    assert_equal idx, two_cristal_balls(data)
    assert_equal -1, two_cristal_balls(Array.new(821, false))
  end
end
