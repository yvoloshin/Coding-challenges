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

  def list_length(list_node)
  	if list_node.next_node.nil?
      @length+=1
      return @length
    else
      @length+=1
      list_length(list_node.next_node)
    end
  end

  def add(number)
        # Traverse to the end of the list
        # And insert a new node over there with the specified value
    current_head = @head
    while current_head.next_node != nil
      current_head = current_head.next_node
    end 
    current_head.next_node = LinkedListNode.new(number,nil)
    self    
  end

def display
        # Traverse through the list till you hit the "nil" at the end
        current_head = @head
        full_list = [] 
        while current_head.next_node != nil 
            full_list += [current_head.value.to_s]
            current_head = current_head.next_node
        end
        full_list += [current_head.value.to_s]
        puts full_list.join("->")
    end

end #class LinkedList

class Stack
  attr_reader :data

  def add(number)
        # Traverse to the end of the list
        # And insert a new node over there with the specified value
    current_head = @head
    while current_head.next_node != nil
      current_head = current_head.next_node
    end 
    current_head.next_node = LinkedListNode.new(number,nil)
    self    
  end
    
  def initialize
      @data = nil
  end

  # Push an item onto the stack
  def push

  end

  # Pop an item off the stack.  
  # Remove the last item that was pushed onto the
  # stack and return it to the user
  def pop
      # IMPLEMENT ME
  end

end

nodes = LinkedList.new(37)
nodes.Stack.add(99)
nodes.Stack.add(12)
#node1 = LinkedListNode.new(37)
#node2 = LinkedListNode.new(99, node1)
#node3 = LinkedListNode.new(12, node2)
#new_node = LinkedListNode.new(10)


nodes.display


