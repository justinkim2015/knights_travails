require_relative 'node'
require_relative 'knight'
require_relative 'board'
require 'pry'

board = Board.new
board.make_board
board.add_all_edges
board.level_order(board.nodes[[0, 0]], [3, 3])
