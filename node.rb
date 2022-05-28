class Node
  attr_accessor :value, :adjacent_nodes

  def initialize(value)
    @value = value
    @adjacent_nodes = []
  end

  def make_adjacent_nodes
    array = []
    array << make_adjacent_node(1, 2)
    array << make_adjacent_node(2, 1)
    array << make_adjacent_node(2, -1)
    array << make_adjacent_node(1, -2)
    array << make_adjacent_node(-1, -2)
    array << make_adjacent_node(-2, -1)
    array << make_adjacent_node(-2, 1)
    array << make_adjacent_node(-1, 2)
    array
  end

  def make_adjacent_node(change_x, change_y)
    Node.new([(value[0] + change_x), (value[1] + change_y)])
  end

  def filter(adjacent_nodes)
    array = []
    i = 0
    adjacent_nodes.each do
      if adjacent_nodes[i].value[0].between?(0, 7) && adjacent_nodes[i].value[1].between?(0,7)
        array << adjacent_nodes[i]
      end
      i += 1
    end
    array
  end

  def update_nodes(node)
    all_nodes = node.make_adjacent_nodes
    @adjacent_nodes << filter(all_nodes)
  end
end