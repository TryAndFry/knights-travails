class Knight_Graph
  @adjacency_list

  def initialize
    ranks = {}
    numbers = *1..64
    numbers.each_slice(8).with_index{|slice, i| ranks[i + 1] = slice}
    @adjacency_list = {}
    1.upto(64){|i|
      neighbors = []
      file = i % 8
      file = 8 if file == 0
      rank = ranks.select{|k| ranks[k].include?(i)}.keys.first
      moves = [[-2,-1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
      moves.each{|move|
        rank_temp = rank + move[0]
        file_temp = file + move[1]
        neighbors.push((rank_temp - 1)*8 + file_temp) if (rank_temp.between?(1,8) and file_temp.between?(1,8))
      }
      @adjacency_list[i] = neighbors
    }
  end

  def num_to_coord(num)
    ranks = {}
    numbers = *1..64
    numbers.each_slice(8).with_index{|slice, i| ranks[i + 1] = slice}
    rank = ranks.select{|k| ranks[k].include?(num)}.keys.first
    file = num % 8
    file = 8 if file == 0
    return [file-1, rank-1]
  end

  def coord_to_num(arr)
    file, rank = arr
    file += 1
    rank += 1
    8*(rank - 1) + file
  end

  def knight_moves(start, destination)
    q = []
    q.push(coord_to_num(start))
    visited = []
    result =[]
    ptr = q.first
    visited.push(coord_to_num(start))
    prev = Array.new(64)
    until num_to_coord(ptr) == destination
      ptr = q.shift
      @adjacency_list[ptr].each{|position|
        unless visited.include?(position)
          q.push(position)
          visited.push(position)
          prev[position] = ptr
        end
      }
    end
    prev
    path = []
    path.unshift(destination)
    ptr = coord_to_num(destination)
    until prev[ptr].nil?
      path.unshift(num_to_coord(prev[ptr]))
      ptr = prev[ptr]
    end
    p "You made it in #{path.size-1} move#{path.size-1 == 1 ? '' : 's'}! Here's your path:"
    path.each{|move| p move}
  end

end