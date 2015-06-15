
  gem 'minitest'
  require 'minitest/autorun'
  require './linkedlist1-3'
 
  class TestStack < MiniTest::Test
    def setup
      @stack = Stack.new
    end
 
    def test_stack_push_then_pop_behavior
      @stack.push(1)
      @stack.push(2)
      @stack.push(3)
      assert_equal 3, @stack.pop
      assert_equal 2, @stack.pop
      assert_equal 1, @stack.pop
    end
 
    def test_stack_pop_returns_nil_if_empty
      assert_equal nil, @stack.pop
    end
  end

