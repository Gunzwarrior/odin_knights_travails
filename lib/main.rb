# frozen_string_literal: true

require_relative 'board'

board = Board.new

board.build_board
board.build_links
board.root = board.board[[0, 0]]

board.knight_moves([1, 2], [2, 3])
