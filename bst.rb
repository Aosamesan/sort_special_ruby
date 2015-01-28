class BSTNode
	attr_accessor :data, :left_node, :right_node

	def initialize data, left_node = nil, right_node = nil
		@data = data
		@left_node = left_node
		@right_node = right_node
	end

	def get_data
		return @data
	end

	def get_left
		return @left_node
	end

	def get_right
		return @right_node
	end

	def set_data data
		@data = data
	end

	def set_left left
		@left_node = left
	end

	def set_right right
		@right_node = right
	end

	def is_leaf
		return (@left_node == nil && @right_node == nil)
	end

	protected :data, :left_node, :right_node
end

class BinarySearchTree
	attr_accessor :root_node

	def initialize
		@root_node = nil
	end

	def insert data
		if @root_node == nil
			@root_node = BSTNode.new data
		else
			tree_insert @root_node, (BSTNode.new data)
		end
	end

	def bst_sort push_lambda
		bst_sort_recursive @root_node, push_lambda
	end

# protected method
	def tree_insert sub_root_node, new_node
		if sub_root_node.get_data >= new_node.get_data
			if sub_root_node.get_left == nil
				sub_root_node.set_left new_node
			else
				tree_insert sub_root_node.get_left, new_node
			end
		else
			if sub_root_node.get_right == nil
				sub_root_node.set_right new_node
			else
				tree_insert sub_root_node.get_right, new_node
			end
		end
	end

	def bst_sort_recursive sub_root_node, push_lambda
		if sub_root_node == nil
			return
		end
		bst_sort_recursive sub_root_node.get_left, push_lambda
		push_lambda.call sub_root_node.get_data
		bst_sort_recursive sub_root_node.get_right, push_lambda
	end

	protected :tree_insert, :bst_sort_recursive
end
