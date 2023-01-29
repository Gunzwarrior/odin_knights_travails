require_relative 'board'

board = Board.new

board.build_board

board.build_links

p board.board[[0,0]].right_up.left_down.coordinates