class LinkedListNode
  attr_accessor :value, :next_node
 
  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
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

def is_infinite?(list_node)
  @hare = list_node
  @tortoise = list_node
  is_infinite_recursive(@hare, @tortoise)
end

def is_infinite_recursive(hare, tortoise)
  return false if @hare.next_node == nil
  @hare = @hare.next_node
  return false if @hare.next_node == nil
  @hare = @hare.next_node
  @tortoise = @tortoise.next_node
  return true if @hare == @tortoise
  is_infinite_recursive(@hare, @tortoise)
end


node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node1.next_node = node3

puts is_infinite?(node3)