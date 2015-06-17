class Tree
    attr_accessor :payload, :children

    def initialize(payload, children)
        @payload = payload
        @children = children
    end

    
end


def depth_first(node, target_value)
	@stack = []
	depth_first_recursive(node, target_value)
end

def depth_first_recursive(node, target_value)
  return "value not found" if node.nil?
  node.children.each do |child|
    @stack.push(child) if node != nil
    return "value was found" if child.payload == target_value
  end
  current_node = @stack.pop
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
trunk = Tree.new(2, [seventh_node, fifth_node])
puts depth_first(trunk, 11)


