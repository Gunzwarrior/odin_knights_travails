# frozen_string_literal: true

require_relative 'knight'

# Class representing a chessboard and setting up the knight's path
class Board
  attr_accessor :width, :height, :board, :root

  def initialize(root = [0, 0], width = 8, height = 8)
    @width = width
    @height = height
    @board = {}
    @root = root
  end

  def build_board
    8.times do |i|
      8.times do |j|
        board[[i, j]] = Knight.new([i, j])
      end
    end
  end

  def build_links
    board.each do |key, value|
      value.left_up = board[left_up(key)] if possible?(left_up(key))
      value.left_down = board[left_down(key)] if possible?(left_down(key))
      value.right_up = board[right_up(key)] if possible?(right_up(key))
      value.right_down = board[right_down(key)] if possible?(right_down(key))
      value.up_left = board[up_left(key)] if possible?(up_left(key))
      value.up_right = board[up_right(key)] if possible?(up_right(key))
      value.down_left = board[down_left(key)] if possible?(down_left(key))
      value.down_right = board[down_right(key)] if possible?(down_right(key))
    end
  end

  def left_up(coordinates)
    [coordinates[0] - 2, coordinates[1] + 1]
  end

  def left_down(coordinates)
    [coordinates[0] - 2, coordinates[1] - 1]
  end

  def right_up(coordinates)
    [coordinates[0] + 2, coordinates[1] + 1]
  end

  def right_down(coordinates)
    [coordinates[0] + 2, coordinates[1] - 1]
  end

  def up_left(coordinates)
    [coordinates[0] - 1, coordinates[1] + 2]
  end

  def up_right(coordinates)
    [coordinates[0] + 1, coordinates[1] + 2]
  end

  def down_left(coordinates)
    [coordinates[0] - 1, coordinates[1] - 2]
  end

  def down_right(coordinates)
    [coordinates[0] + 1, coordinates[1] - 2]
  end

  def possible?(coordinates)
    if coordinates[0].negative? || coordinates[0] > width - 1
      false
    elsif coordinates[1].negative? || coordinates[1] > height - 1
      false
    else
      true
    end
  end

  def level_order(start, coordinates)
    queue = []
    queue.push(board[start])
    array = []
    until queue == []
      node = queue.shift
      next if node.nil?

      array.push(node)
      break if node.coordinates == coordinates

      queue.push(node.left_up, node.left_down,
                 node.right_up, node.right_down,
                 node.up_left, node.up_right,
                 node.down_left, node.down_right)
    end
    array
  end

  def knight_moves(start, coordinates)
    array = [coordinates]
    pointer = coordinates
    until array.include?(start)
      array_to_check = level_order(start, pointer)
      array_to_check.reverse_each do |element|
        next unless !element.left_up.nil? && element.left_up.coordinates == pointer ||
                    !element.left_down.nil? && element.left_down.coordinates == pointer ||
                    !element.right_up.nil? && element.right_up.coordinates == pointer ||
                    !element.right_down.nil? && element.right_down.coordinates == pointer ||
                    !element.up_left.nil? && element.up_left.coordinates == pointer ||
                    !element.up_right.nil? && element.up_right.coordinates == pointer ||
                    !element.down_left.nil? && element.down_left.coordinates == pointer ||
                    !element.down_right.nil? && element.down_right.coordinates == pointer

        array.push(element.coordinates)
        pointer = element.coordinates
      end
    end
    p array.reverse
  end
end
