class Node
  attr_accessor :value, :left, :right
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class Tree
  def initialize(array)
    @root = build_tree(array.sort!.uniq!)
  end

  def build_tree(array)
    length = array.length
    if length == 0
      nil
    elsif length == 1
      Node.new(array[0])
    elsif length.even?
      root = Node.new(array[length / 2 - 1])
      root.left = build_tree(array[0, length / 2 - 1])
      root.right = build_tree(array[length / 2, length])
      root
    else
      root = Node.new(array[(length - 1) / 2])
      root.left = build_tree(array[0, (length - 1) / 2])
      root.right = build_tree(array[(length - 1) / 2 + 1, length])
      root
    end
  end

  def insert(value)

  end

  def delete(value)

  end

  def find(value)

  end

  def level_order

  end

  def inorder

  end

  def preorder

  end

  def postorder

  end

  def height

  end

  def depth

  end

  def balanced?

  end

  def rebalance

  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? "│ " : " "}", false) if node.right
    puts "#{prefix}#{is_left ? "└── " : "┌── "}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? " " : "│ "}", true) if node.left
  end


end