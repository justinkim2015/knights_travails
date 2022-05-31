class Node
  attr_accessor :value, :adjacent_nodes

  def initialize(value)
    @value = value
    @adjacent_nodes = []
  end

  def add_edge_node(adjacent_node)
    @adjacent_nodes << adjacent_node
  end

  # def to_s
  #   p @value
  #   puts @adjacent_nodes
  # end
end