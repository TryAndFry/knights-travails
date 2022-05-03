require_relative 'lib/knight_graph'
require_relative 'lib/knight_tree'

g = Knight_Graph.new

g.knight_moves([0, 0], [3, 3])
g.knight_moves([0, 0], [7, 7])

t = Knight_Tree.new

t.knight_moves([0, 0], [3, 3])
t.knight_moves([0, 0], [7, 7])