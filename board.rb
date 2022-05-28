class Board
  attr_accessor :nodes

  def initialize
    @nodes = {}
  end

  def add_node(node)
    @nodes[node.value] = node
  end

  def make_node(x, y)
    node = Node.new([x, y])
    all_nodes = node.make_adjacent_nodes
    filtered = node.filter(all_nodes)
    node.adjacent_nodes << filtered
    add_node(node)
    filtered.each do |value|
      value.adjacent_nodes << node
      add_node(value)
    end
  end
end