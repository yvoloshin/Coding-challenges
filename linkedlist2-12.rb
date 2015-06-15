class LinkedListNode
  attr_accessor :value, :next_node, :previous
 
  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
    
  end
 
 
  def print_values2
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
 
  def reverse_list2  
  #This part iterates through the list starting at @data 
  #and adds :previous attribute to each node     
    
    current_next = @data
    current_next.previous = nil
    while current_next.next_node != nil
      current_next_prev = current_next
      current_next = current_next.next_node
      current_next.previous = current_next_prev
    end
    
#This part iterates through the list starting at the tail 
#and changes nodes' links from next_node to previous
    @data = current_next #@data marks new head of list
    current_next.next_node = current_next.previous
    current_next.next_node.next_node = current_next.previous.previous
    current_next = current_next.next_node
 
    while current_next.next_node != nil
      current_next.next_node = current_next.previous
      current_next.next_node.next_node = current_next.previous.previous
      current_next = current_next.next_node
    end
        
  end


    
end #class Stack


def reverse_list2_2(node, previous=nil)
  return previous if node.nil?
  new_next_node = node.next_node
  node.next_node = previous
  reverse_list2_2(new_next_node, node)

end

def print_values(node)
    print "#{node.value} --> "
    if node.next_node.nil?
      print "nil\n"
      return
    else
      print_values(node.next_node)
    end
end
 
ll1=LinkedListNode.new(37)
ll2=LinkedListNode.new(99,ll1)
ll3=LinkedListNode.new(12,ll2)
print_values(ll3)
rev_list = reverse_list2_2(ll3)
print_values(rev_list)



 