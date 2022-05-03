class Knight_Tree
  attr_accessor :root
  @@moves = [[-2,-1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]

  def initialize(start = nil)
    @root = Node.new(start, [], nil)
  end

  def build_children(node = @root)
    return if node.nil?
    file, rank = node.position
    @@moves.each_with_index{|move, index|
      file_temp = file + move[0]
      rank_temp = rank + move[1]
      node.children[index] = Node.new([file_temp, rank_temp], [], node) if rank_temp.between?(0,7) and file_temp.between?(0,7) #only accept valid positions on board
    }
    node.children.reject!{|e| e.nil?} #get rid of any nils in the children array
  end

  def knight_moves(start, destination)
    q = []
    @root = Node.new(start, [], nil)
    q.push(@root)
    ptr = q.first
    visited = []
    until ptr.position == destination
      ptr = q.shift
      build_children(ptr) #build the next layer of nodes to visit
      ptr.children.each{|child|
        q.push(child) unless child.nil? or visited.include?(child.position)
        visited.push(child.position) unless child.nil? or visited.include?(child.position)
      }
    end
    path = [] #build path by going back through the parents
    path.unshift(ptr.position)
    until ptr.parent.nil?
      path.unshift(ptr.parent.position)
      ptr = ptr.parent
    end
    p "You made it in #{path.size-1} move#{path.size-1 == 1 ? '' : 's'}! Here's your path:"
    path.each{|move| p move}
    path
  end
  
  class Node
    attr_accessor :position, :children, :parent
    def initialize(start = [0, 0], children = [], parent = nil)
      @position =  start
      @children = children
      @parent = parent
    end
  end
end