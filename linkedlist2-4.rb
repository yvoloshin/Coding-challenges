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
  #This part adds :previous attribute to each node     
    class << @data 
        attr_accessor :previous
      end
    current_next = @data.next_node
    @data.previous = current_next
    current_next_prev = current_next
    @data.next_node = nil
    while current_next != nil
      class << current_next 
        attr_accessor :previous
      end
      current_next.previous = current_next_prev
      current_next_prev = current_next
      current_next = current_next.next_node
    end
#This part iterates through the list starting at the tail 
#and changes nodes' links from next_node to previous
    current_next = current_next_prev  
    current_next_prev = current_next.previous
    puts "current_next.value = #{current_next.value}"
    puts "current_next_prev.value = #{current_next_prev.value}"
    #while current_next.previous != nil
      current_next.next_node = current_next.previous    
      current_next = current_next.next_node
      current_next_prev = current_next.previous   
    #end
    
    puts '---'
    puts "current_next.value = #{current_next.value}"
    puts "current_next_prev.value = #{current_next_prev.value}"
    puts "current_next.previous.value = #{current_next.previous.value}"

    current_next.next_node = current_next.previous    
      current_next = current_next.next_node
      current_next_prev = current_next.previous   
    #end
    
    puts '---'
    puts "current_next.value = #{current_next.value}"
    puts "current_next_prev.value = #{current_next_prev.value}"
    puts "current_next.previous.value = #{current_next.previous.value}"

    puts ''
    puts current_next.inspect
    puts ''
    puts current_next_prev.inspect

    puts @data.inspect
    
  end
    
end #class Stack

stack = Stack.new
stack.push(10)
stack.push(20)
stack.push(30)
stack.push(40)
stack.print_values
stack.reverse_list2
#stack.print_values







