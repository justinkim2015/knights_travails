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
    @nodes[node2].add_edge_node(@nodes[node1])
  end

  def all_edges
    array = []
    possible_values = [0, 1, 2, 3, 4, 5, 6, 7]
    arr = possible_values.repeated_permutation(2).to_a
    i = 0
    arr.length.times do
      array << filter(adjacent_node_values(i[0], i[1]))
      i += 1
    end
    array
  end

  def filtered_values(coord_x, coord_y)
    filter(adjacent_node_values(coord_x, coord_y))
  end

  def adjacent_node_values(coord_x, coord_y)
    array = []
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
end