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

  # Slam everything into the queue then look through the queue, its an array,
  # to find the exit point.  Next question, how to get to the end point efficiently?
  def level_order(entry, fin)
    visited = []
    queue = []

    queue << entry

    until queue.empty?
      # binding.pry
      current = queue[0]
      p current.value
      if fin == current.value
        puts "You reached #{fin}!"
        break
      end
      visited << current
      puts "You visited #{current.value}"
      current.adjacent_nodes.each do |node|
        queue << node unless visited.include?(node)
      end
      queue.shift
    end
  end
  # Looking at the adjacent nodes, find the node closest to the one I want to go to
  # and move to that node, then repeat
  # THERE ARE NON-LEGAL MOVES IN MY TRAVERSAL
end
