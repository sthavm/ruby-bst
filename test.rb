require_relative 'bst'

a = Array.new(15) { rand(1..100) }

new_tree = Tree.new(a)
new_tree.pretty_print
puts "Balanced: #{new_tree.balanced?}"

print 'Level order: '
print new_tree.level_order
puts "\n"
print 'Preorder: '
print new_tree.preorder
puts "\n"
print 'Postorder: '
print new_tree.postorder
puts "\n"
print 'Inorder: '
print new_tree.inorder
puts "\n"

new_tree.insert(105)
new_tree.insert(110)
new_tree.insert(115)
new_tree.insert(120)
new_tree.insert(125)
new_tree.insert(130)
new_tree.insert(135)

new_tree.pretty_print
puts "Balanced: #{new_tree.balanced?}"
new_tree.rebalance

new_tree.pretty_print
puts "Balanced: #{new_tree.balanced?}"

print 'Level order: '
print new_tree.level_order
puts "\n"
print 'Preorder: '
print new_tree.preorder
puts "\n"
print 'Postorder: '
print new_tree.postorder
puts "\n"
print 'Inorder: '
print new_tree.inorder
puts "\n"