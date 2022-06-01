require_relative 'node'
require_relative 'knight'
require_relative 'board'
require 'pry'

board = Board.new
board.make_board
board.add_all_edges
# board.knight_moves(board.nodes[[0, 0]], [3, 3])
# puts '-------------------------------'
board.knight_moves(board.nodes[[3, 3]], [5, 6])
