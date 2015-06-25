
  gem 'minitest'
  require 'minitest/autorun'
  require './binarytree'
 
  class TestStack < MiniTest::Test
 
    def test_sort_array
      unsorted_arr = [7, 4, 9, 1, 6, 14, 10]
      sorted = btree(unsorted_arr)
      assert_equal [1, 4, 6, 7, 9, 10, 14], sorted
    end
 
  end

