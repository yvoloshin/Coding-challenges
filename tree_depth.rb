class Tree
    attr_accessor :payload, :children

    def initialize(payload, children)
        @payload = payload
        @children = children
    end

    
end


def depth_first(node, target_value)
	@trunk = node
	@branch_idx = 0
	@branch_arr = []
	@branch_arr_idx = 0
	depth_first_recursive(node, target_value)
end

def depth_first_recursive(node, target_value)
  return true if node.payload == target_value
  current_node = node
  puts "payload=#{current_node.payload}"
  if current_node.children[@branch_idx+1] != nil
  	@branch_arr.unshift(current_node)
  #	puts @branch_arr.inspect
  end
  if current_node.children.empty?
  	branch_node = @branch_arr[@branch_arr_idx]
  	@branch_idx += 1 
  	if (@branch_idx >= branch_node.children.length) && (@branch_arr_idx >= @branch_arr.length-1)
  		return false
  	elsif @branch_idx >= branch_node.children.length
  		@branch_arr_idx += 1
  		branch_node = @branch_arr[@branch_arr_idx]
  		@branch_idx = 1
  	end
  #	puts "branch_node ="
  #	puts branch_node.inspect
  	current_node = branch_node.children[@branch_idx]
  #	puts "current_node ="
  #	puts current_node.inspect
  	else current_node = current_node.children[0]
  end
  depth_first_recursive(current_node, target_value)
end

# The "Leafs" of a tree, elements that have no children
fifth_node    = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])


# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, fifth_node])
puts depth_first(trunk, 10).to_s


