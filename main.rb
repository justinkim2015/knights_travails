require_relative 'node'
require_relative 'knight'
require_relative 'board'
require 'pry'

node = Node.new([6, 6])
node1 = Node.new([0, 1])
node.make_adjacent_nodes
