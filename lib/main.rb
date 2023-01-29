require_relative 'board'

board = Board.new

board.build_board
board.build_links
board.root = board.board[[0,0]]

board.find_whole_path([2,3])