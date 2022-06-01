class Board
  attr_accessor :nodes

  def initialize
    @nodes = {}
  end

  def add_node(node)
    @nodes[node.value] = node
  end

  def make_board
    possible_values = [0, 1, 2, 3, 4, 5, 6, 7]
    arr = possible_values.repeated_permutation(2).to_a
    i = 0
    arr.length.times do
      add_node(Node.new(arr[i]))
      i += 1
    end
  end

  def add_edge(node1, node2)
    @nodes[node1].add_edge_node(@nodes[node2])
  end

  def add_all_edges
    array = all_edge_values

    array.each do |subarray|
      i = 1
      (subarray.length - 1).times do
        add_edge(subarray[0], subarray[i])
        i += 1
      end
    end
  end

  def all_edge_values
    array = []
    possible_values = [0, 1, 2, 3, 4, 5, 6, 7]
    arr = possible_values.repeated_permutation(2).to_a
    i = 0
    arr.length.times do
      array << filtered_values(arr[i][0], arr[i][1])
      i += 1
    end
    array
  end

  def filtered_values(coord_x, coord_y)
    filter(adjacent_node_values(coord_x, coord_y))
  end

  def adjacent_node_values(coord_x, coord_y)
    array = [[coord_x, coord_y]]
    array << [(coord_x + 2), (coord_y + 1)]
    array << [(coord_x + 1), (coord_y + 2)]
    array << [(coord_x + 2), (coord_y - 1)]
    array << [(coord_x + 1), (coord_y - 2)]
    array << [(coord_x - 1), (coord_y - 2)]
    array << [(coord_x - 2), (coord_y - 1)]
    array << [(coord_x - 2), (coord_y + 1)]
    array << [(coord_x - 1), (coord_y + 2)]
    array
  end

  def filter(adjacent_nodes)
    array = []
    i = 0
    adjacent_nodes.each do
      if adjacent_nodes[i][0].between?(0, 7) && adjacent_nodes[i][1].between?(0,7)
        array << adjacent_nodes[i]
      end
      i += 1
    end
    array
  end

  def knight_moves(entry, fin)
    visited = []
    queue = []

    queue << entry

    until queue.empty?
      current = queue[0]
      if fin == current.value
        # entry.prev is set to nil so the trace_path method has an exit point
        entry.prev = nil
        puts "It took #{current.distance} moves! to reach #{fin}"
        puts 'The path was:'
        trace_path(current)
        break
      end
      visited << current
      current.adjacent_nodes.each do |node|
        node.distance = current.distance + 1
        unless visited.include?(node)
          queue << node
          node.prev = current
        end
      end
      queue.shift
    end
  end

  def trace_path(node)
    arr = []

    until node.nil?
      arr << node.value
      node = node.prev
    end
    arr.reverse.each do |coord|
      p coord
    end
  end
end
