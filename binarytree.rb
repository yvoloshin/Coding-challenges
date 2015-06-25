class BinaryTree
    attr_accessor :payload, :left, :right

    def initialize(payload, left=nil, right=nil)
        @payload = payload
        @left = left
        @right = right
    end

end

	def btree(unsorted_arr)
	  first_number = unsorted_arr.shift
		@trunk = BinaryTree.new(first_number)
		prev_node = @trunk
	  unsorted_arr.each do |number|	 
	  	insert(number, @trunk)
	  end
		@sorted = []
		inOrderTraversal
	end

	def insert(number, trunk)
		prev_node = trunk
  	while prev_node != nil	
	  	if number < prev_node.payload && prev_node.left == nil
		  	prev_node.left = BinaryTree.new(number)
		  	prev_node = @trunk  
		  elsif number > prev_node.payload && prev_node.right == nil
		  	prev_node.right = BinaryTree.new(number)
		  	prev_node = @trunk
		  elsif number < prev_node.payload && prev_node.left != nil
			  prev_node = prev_node.left
		  elsif number > prev_node.payload && prev_node.right != nil
			  prev_node = prev_node.right
		  else
		  	return
		  end
		end
	end
		
		
def inOrderTraversal(node = @trunk) 
  return @sorted if (node == nil)
  inOrderTraversal(node.left)
  @sorted.push(node.payload)
  inOrderTraversal(node.right)
end


unsorted_arr = [7, 4, 9, 1, 6, 14, 10]
sorted = btree(unsorted_arr)

if __FILE__ == $0

gem 'minitest'
  require 'minitest/autorun'
  require './binarytree'
 
  class TestStack < MiniTest::Test
 
    def test_sort_array
      unsorted_arr = [7, 4, 9, 1, 6, 14, 10]
      sorted = btree(unsorted_arr)
      assert_equal [1, 4, 6, 7, 9, 10, 14], sorted
    end
 
  end
end

