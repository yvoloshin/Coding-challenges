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
  #This part iterates through the list starting at @data 
  #and adds :previous attribute to each node     
    
    current_next = @data
    #current_next_prev = current_next
    #current_next = current_next.next_node
    current_next.previous = nil
    #@data.next_node = nil
    puts "before while: current_next.value = #{current_next.value}"
    #puts "before while: current_next.previous.value = #{current_next.previous.value}"
    puts "before while: current_next.next_node.value = #{current_next.next_node.value}"
    while current_next.next_node != nil
      current_next_prev = current_next
      current_next = current_next.next_node
      current_next.previous = current_next_prev
      
    puts "during while: current_next.value = #{current_next.value}"
    puts "during while: current_next.previous.value = #{current_next.previous.value}"
      
    end

    
#This part iterates through the list starting at the tail 
#and changes nodes' links from next_node to previous
    @head = current_next
    puts current_next.inspect
    puts "current_next.value = #{current_next.value}"
    puts "current_next.previous.value = #{current_next.previous.value}"
    #puts "current_next.next_node.value = #{current_next.next_node.value}"
    puts ''

    current_next.next_node = current_next.previous
    current_next.next_node.next_node = current_next.previous.previous
    current_next = current_next.next_node
    puts "current_next.value = #{current_next.value}"
    puts "current_next.previous.value = #{current_next.previous.value}"
    puts "current_next.next_node.value = #{current_next.next_node.value}"
    puts "@head = #{@head.value}"
puts ''
    current_next.next_node = current_next.previous
    current_next.next_node.next_node = current_next.previous.previous
    current_next = current_next.next_node
    puts "current_next.value = #{current_next.value}"
    puts "current_next.previous.value = #{current_next.previous.value}"
    puts "current_next.next_node.value = #{current_next.next_node.value}"
    puts "@head = #{@head.value}"
puts ''
    
    
    current_next.next_node = current_next.previous
    current_next.next_node.next_node = current_next.previous.previous
    current_next = current_next.next_node
    puts "current_next.value = #{current_next.value}"
    #puts "current_next.previous.value = #{current_next.previous.value}"
    if current_next.next_node.nil?
      puts "current_next.next_node.value = nil"
    else
      puts "current_next.next_node.value = #{current_next.next_node.value}"
    end
    
puts ''

    while @head != nil
      print "#{@head.value} --> "
      @head = @head.next_node
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
#stack.print_values







