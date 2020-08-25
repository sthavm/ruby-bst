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
    if @root.nil?
      @root = Node.new(value)
    else
      unless contains?(value)
        current_node = @root
        loop do
          if current_node.value > value
            if current_node.left.nil?
              current_node.left = Node.new(value)
              break
            else 
              current_node = current_node.left
            end
          elsif current_node.value < value
            if current_node.right.nil?
              current_node.right = Node.new(value)
              break
            else
              current_node = current_node.right
            end
          end
        end
      end
    end
  end

  def contains?(value)
    current_node = @root
    loop do
      if current_node.nil?
        return false
      elsif current_node.value == value
        return true
      elsif current_node.value > value
        current_node = current_node.left
      elsif current_node.value < value
        current_node = current_node.right
      end
    end
  end

  def delete(node = @root, value)
    if contains?(value)
      if node.value > value
        node.left = delete(node.left, value)
      elsif node.value < value
        node.right = delete(node.right, value)
      else
        if node.left.nil?
          tmp = node.right
          node = nil
          return tmp
        elsif node.right.nil?
          tmp = node.left
          node = nil
          return tmp
        end
        tmp = find(inorder(node.right)[0])
        node.value = tmp.value
        node.right = delete(node.right, tmp.value)
      end
      node
    end
  end

  def find(value)
    current_node = @root
    until current_node.nil?
      if current_node.value == value 
        return current_node
      elsif current_node.value > value
        current_node = current_node.left
      elsif current_node.value < value
        current_node = current_node.right
      end
    end
    nil
  end

  def level_order
    return [] if @root.nil?

    frontier = [@root]
    result = []
    until frontier.empty?
      current_node = frontier.shift
      result.push(current_node.value)
      frontier.push(current_node.left) unless current_node.left.nil?
      frontier.push(current_node.right) unless current_node.right.nil?
    end
    result
  end

  def inorder(node=@root)
    if node.nil?
      return []
    end
    left_subtree_array = inorder(node.left)
    right_subtree_array = inorder(node.right)
    left_subtree_array + [node.value] + right_subtree_array
  end

  def preorder(node = @root)
    if node.nil?
      return []
    end
    left_subtree_array = preorder(node.left)
    right_subtree_array = preorder(node.right)
    [node.value] + left_subtree_array + right_subtree_array
  end

  def postorder(node = @root)
    if node.nil?
      return []
    end
    left_subtree_array = postorder(node.left)
    right_subtree_array = postorder(node.right)
    left_subtree_array + right_subtree_array + [node.value]
  end

  def height(node)
    if node.nil? || (node.left.nil? && node.right.nil?)
      0
    else
      left_node_height = height(node.left)
      right_node_height = height(node.right)
      left_node_height > right_node_height ? left_node_height + 1 : right_node_height + 1
    end
  end

  def depth(node)
    current_depth = 0
    current_node = @root
    until current_node == node || current_node.nil?
      current_node = current_node.value < node.value ? current_node.right : current_node.left
      current_depth += 1
    end
    current_depth
  end

  def balanced?(node = @root)
    return true if node.nil?

    ((height(node.left) - height(node.right)).abs <= 1) && (balanced?(node.right) && balanced?(node.left))
  end

  def rebalance
    @root = build_tree(level_order)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? "│ " : " "}", false) if node.right
    puts "#{prefix}#{is_left ? "└── " : "┌── "}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? " " : "│ "}", true) if node.left
  end


end