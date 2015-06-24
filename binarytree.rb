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
		  if number < prev_node.payload && prev_node.left != nil
		  	while prev_node.left != nil
			  	puts "moved #{number} past #{prev_node.payload} to #{prev_node.left.payload}"
			  	prev_node = prev_node.left
		  	end
		  end
		  if number < prev_node.payload && prev_node.left == nil
		  	prev_node.left = BinaryTree.new(number)
		  	puts "inserted #{number} to the left of #{prev_node.payload}"
		  	prev_node = @trunk
		  end
		  if number > prev_node.payload && prev_node.right != nil
		  	while prev_node.right != nil
			  	puts "moved #{number} past #{prev_node.payload} to #{prev_node.right.payload}"
			  	prev_node = prev_node.right
		  	end
		  end
		  if number > prev_node.payload && prev_node.right == nil
		  	prev_node.right = BinaryTree.new(number)
		  	puts "inserted #{number} to the right of #{prev_node.payload}"
		  	prev_node = @trunk
		  end	  
		  
		  if number < prev_node.payload && prev_node.left == nil
		  	prev_node.left = BinaryTree.new(number)
		  	puts "inserted: #{number}"
		  	prev_node = @trunk
		  end
		  if number > prev_node.payload && prev_node.right == nil
		  	prev_node.right = BinaryTree.new(number)
		  	puts "inserted: #{number}"
		  	prev_node = @trunk
		  end	  
		end
		puts "trunk =="
		puts @trunk.inspect
		@stack = []
		collect_nodes(@trunk)
	end

	def collect_nodes(node)
		return if node.nil?
  	[node.left, node.right].each do |child|
    	@stack.push(child) if node != nil
  	end
  	puts "stack =="
  	puts @stack.inspect
		current_node = @stack.pop
		puts "current_node =="
		puts current_node.inspect
	  if current_node != nil
	  	puts "payload = #{current_node.payload}, left = #{current_node.left}, right = #{current_node.right}"
	  else puts "node == nil"
	  end
	  collect_nodes(current_node)
	end
			



unsorted_arr = [7, 4, 9, 1, 6, 14, 10]
btree(unsorted_arr)

