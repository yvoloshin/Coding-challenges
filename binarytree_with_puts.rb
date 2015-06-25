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
	  	puts "number = #{number}" 
	  	insert(number, @trunk)
	  end
	  puts "trunk =="
		puts @trunk.inspect
		@stack = []
		@arr = []
		collect_nodes(@trunk)
		puts @arr.inspect
		inOrderTraversal
	end

	def insert(number, trunk)
		prev_node = trunk
  	while prev_node != nil	
	  	if number < prev_node.payload && prev_node.left == nil
		  	prev_node.left = BinaryTree.new(number)
		  	puts "inserted #{number} to the left of #{prev_node.payload}"
		  	prev_node = @trunk  
		  elsif number > prev_node.payload && prev_node.right == nil
		  	prev_node.right = BinaryTree.new(number)
		  	puts "inserted #{number} to the right of #{prev_node.payload}"
		  	prev_node = @trunk
		  elsif number < prev_node.payload && prev_node.left != nil
			  	puts "moved #{number} past #{prev_node.payload} to #{prev_node.left.payload}"
			  	prev_node = prev_node.left
		  elsif number > prev_node.payload && prev_node.right != nil
			  	puts "moved #{number} past #{prev_node.payload} to #{prev_node.right.payload}"
			  	prev_node = prev_node.right
		  else
		  	return
		  end
		end
	end
		


	def collect_nodes(node)
		return if node.nil?
  	[node.left, node.right].each do |child|
    	@stack.push(child) if child != nil
  	end
  	#puts "stack =="
  	#puts @stack.inspect
		current_node = @stack.pop
		#puts "current_node =="
		#puts current_node.inspect
	  if current_node != nil
	  	puts "current_node payload = #{current_node.payload}, left = #{current_node.left}, right = #{current_node.right}"
	  	@arr.push(current_node.payload)
	  else puts "node == nil"
	  end
	  collect_nodes(current_node)
	end
		
def inOrderTraversal(node = @trunk)
       return if (node == nil)
        inOrderTraversal(node.left)
        puts node.payload.to_s
        inOrderTraversal(node.right)
    end


unsorted_arr = [7, 4, 9, 1, 6, 14, 10]
btree(unsorted_arr)

