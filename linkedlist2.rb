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
  #  class << @data 
  #      attr_accessor :previous
  #    end
  #  @data.previous = @data.next_node
    current_next = @data.next_node
    while current_next.next_node != nil
      class << current_next 
        attr_accessor :previous
      end
      current_next.previous = current_next.next_node
      current_next = current_next.next_node
    end
    puts @data.inspect
    puts "---"
    puts current_next.inspect

  end
    
end #class Stack

stack = Stack.new
stack.push(10)
stack.push(20)
stack.push(30)
stack.print_values
stack.reverse_list2
#stack.print_values







