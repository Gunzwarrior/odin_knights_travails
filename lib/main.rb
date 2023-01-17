require_relative 'board'

board = Board.new

p board.root

p board.find_whole_path([3,3])