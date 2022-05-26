class Node
  attr_accessor

  def initialize(value)
    @value = value
    @adjacent_nodes = []
  end

  def add_edge(adjacent_node)
    @adjacent_nodes << adjacent_node
  end
end