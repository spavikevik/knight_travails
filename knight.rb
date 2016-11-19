require_relative 'node'
class Knight
  Offset = [[1,2], [-1,-2], [1,-2], [-1,2], [2,1], [-2,-1], [-2,1], [2,-1]]

  def within_bounds?(coordinates)
    (0..7).include?(coordinates.first) && (0..7).include?(coordinates.last)
  end

  def generate_possible_moves(position)
    x, y = position
    Offset.map{|a, b| [a+x, b+y]}.select{|move| within_bounds? move}
  end

  def knight_moves(start_position, end_position)
    backtrace discover_path end_position, start_position
  end

  def backtrace(node)
    path = []
    loop do
      break if node.nil?
      path << node.value
      node = node.parent
    end
    path.reverse
  end

  def discover_path(end_position, start_position)
    queue = [Node.new(start_position)]
    loop do
      node = queue.shift
      return node if node == end_position
      queue += node.add_children(generate_possible_moves(node.value))
    end
  end
end
