gem 'minitest'
require 'minitest/autorun'
require './is_obstructed'

class TestFunction < MiniTest::Test
 
  def test_is_obstructed
    is_obstructed = is_obstructed?([2, 1], [5, 1], [3, 1])
    assert_equal true, is_obstructed
    is_obstructed2 = is_obstructed?([2, 1], [5, 1], [5, 1])
    assert_equal false, is_obstructed2
    is_obstructed3 = is_obstructed?([1, 1], [1, 3], [1, 2])
    assert_equal true, is_obstructed3
    is_obstructed4 = is_obstructed?([1, 3], [1, 1], [1, 2])
    assert_equal true, is_obstructed4
    is_obstructed5 = is_obstructed?([0, 7], [3, 4], [4, 3])
    assert_equal false, is_obstructed5
    is_obstructed6 = is_obstructed?([0, 7], [3, 4], [2, 5])
    assert_equal true, is_obstructed6
    is_obstructed7 = is_obstructed?([3, 3], [1, 4])
    assert_equal 'move is not a straight line', is_obstructed7
  end

end
 
    
