class LinkedListNode
  attr_accessor :value, :next_node
 
  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end

end

class LinkedList

	def initialize(value)
		@head=LinkedListNode.new(value, nil)
	end

  def print_values(list_node)
    print "#{list_node.value} --> "
    if list_node.next_node.nil?
      print "nil\n"
      return
    else
      print_values(list_node.next_node)
    end
  end

  
  def add_to_queue(number)
    current_head = @head
    while current_head.next_node != nil
      current_head = current_head.next_node
    end 
    current_head.next_node = LinkedListNode.new(number,nil)
  end

  def push(number)
  	#current_head = @head
  	#new_node = LinkedListNode.new(number, current_head)
  	#new_node.next_node = current_head
  	#@head = new_node
    @head = LinkedListNode.new(number, @head)

  end

  def pop
  	#popped_element=@head
  	#@head=popped_element.next_node
    @head = @head.next_node
  	return @head.value
  end

  def reverse_list
  	#current_head refers to original list
  	#current_tail refers to new reverse_list
  	current_head = @head
  	current_tail = LinkedListNode.new(current_head.value, nil)
  	current_head = current_head.next_node
  	while current_head != nil		
  		new_list = LinkedListNode.new(current_head.value, current_tail)
  		current_head = current_head.next_node
  		current_tail = new_list
  		@head = current_tail
  	end
  end

	def display
		list_node = @head
	     print "#{list_node.value} --> "
	    if list_node.next_node.nil?
	      print "nil\n"
	      return
	    else
	      print_values(list_node.next_node)
	  end
	end

end #class LinkedList


nodes = LinkedList.new(37)
nodes.push(99)
nodes.push(12)
nodes.display
nodes.pop
nodes.display
nodes.reverse_list
nodes.display




