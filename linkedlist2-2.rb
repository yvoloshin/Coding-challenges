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
    #puts @data.inspect
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

  def reverse_list2
    #value1 = @data.value
    #value2 = (@data.next_node).value
    #@data.value = value2
    #(@data.next_node).value = value1
    #@new_data = @data.next_node
    #puts @data.inspect
    test_node = @data
    while test_node != nil
      @new_data = @data
      while @new_data.next_node != nil
        value1 = @new_data.value
        value2 = (@new_data.next_node).value
        @new_data.value = value2
        (@new_data.next_node).value = value1
        @new_data = @new_data.next_node
      end
      test_node = test_node.next_node
    end
    puts @new_data.inspect 
    puts @data.inspect
    
  end



end #class Stack

stack = Stack.new
stack.push(10)
stack.push(20)
stack.push(30)
stack.push(40)
#stack.push(50)
stack.print_values
stack.reverse_list2
stack.print_values







