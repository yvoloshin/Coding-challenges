class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end


  def print_values
    print "#{value} --> "
    if next_node.nil?
      print "nil\n"
      return
    else
      next_node.print_values
    end
  end

end #class LinkedList

class Stack
 attr_reader :data

    def initialize
        @data = nil
    end

  def print_values
    print "#{@data.value} --> "
    if @data.next_node.nil?
      print "nil\n"
      return
    else
      @data.next_node.print_values
    end
  end


  def push(value)
    @data = LinkedListNode.new(value, @data)
  end

  def pop
    return if @data.nil?
    value = @data.value
    @data = @data.next_node
    return value
  end

  def reverse_list
    @new_data = LinkedListNode.new(pop, nil)
    while @data != nil
      @new_data = LinkedListNode.new(pop, @new_data)
    end
    @data = @new_data
  end

end #class Stack

stack = Stack.new
stack.push(10)
stack.push(20)
stack.push(30)
stack.print_values
stack.reverse_list
stack.print_values

if __FILE__ == $0
  gem 'minitest'
  require 'minitest/autorun'

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
end
