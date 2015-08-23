require 'minitest/autorun'
require_relative 'longest_substring'

class LongestSubstringTest < Minitest::Test
  def test_nil_case
  	longest = LongestSubstring.find(nil, nil)
  	assert_equal nil, longest
  end

  def test_no_common_substrings
  	longest = LongestSubstring.find("a", "b")
  	assert_equal nil, longest
  end

  def test_short_string
  	longest = LongestSubstring.find("ABCDAF", "ACBCF")
  	assert_equal "ABCF", longest.chars.sort.join
  end



end
