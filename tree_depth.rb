class Tree
    attr_accessor :payload, :children

    def initialize(payload, children)
        @payload = payload
        @children = children
    end

    
end


def depth_first(node, target_value)
	@trunk = node
	@children_idx = 0
	@pass = 0
	depth_first_continued(node, target_value)
end

def depth_first_continued(node, target_value)
  return true if node.payload == target_value
  puts "payload=#{node.payload}"
  puts "pass=#{@pass}"
  if node.children.empty?
  	@children_idx += 1
  	@pass += 1
  	depth_first_continued(@trunk, target_value)
  end
  if node.children[@children_idx].nil?
  	puts "node.children[#{@children_idx}]=nil"
  	node = node.children[@children_idx-@pass]
  else
  	node = node.children[@children_idx]
  end
  depth_first_continued(node, target_value)
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
puts depth_first(trunk, 11).to_s


