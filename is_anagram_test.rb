gem 'minitest'
require 'minitest/autorun'
require './is_anagram'

class TestCalculator<MiniTest::Test

  def anagram_test
    result1 = is_anagram('anagram', 'nag a ram')
    result2 = is_anagram('anagram', 'nag a rum')
    assert_equal true, result1
    assert_equal false, result2
  end

end
