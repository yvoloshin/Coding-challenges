class LinkedListNode
  attr_accessor :value, :next_node, :previous
 
  def initialize(value, next_node=nil, previous=nil)
    @value = value
    @next_node = next_node
    @previous = previous
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
    @current_next = @data
    @current_next.previous = nil
    while @current_next.next_node != nil
      current_next_prev = @current_next
      @current_next = @current_next.next_node
      @current_next.previous = current_next_prev   
    end
  end

  def print_previous_values
    while @current_next != nil
      print "#{@current_next.value} --> "
      @current_next = @current_next.previous
    end
    print "nil\n"
  end


end #class Stack

stack = Stack.new
stack.push(10)
stack.push(20)
stack.push(30)
stack.push(40)
stack.print_values
stack.reverse_list2
stack.print_previous_values







