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

  def add_edge_node(adjacent_node)
    @adjacent_nodes << adjacent_node
  end
end