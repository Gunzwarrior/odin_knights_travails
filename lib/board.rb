require_relative 'knight'

class Board

  attr_accessor :width, :height
  attr_reader :root
  def initialize(root = [0, 0], width = 8, height = 8)
    @width = width
    @height = height
    @root = build_path(root)
  end

  def build_board
    board = []
    8.times do |i|
      8.times do |j|
        board.push(Knight.new([i, j]))
      end
    end
    p board
  end

  def build_path(root, visited = [])
    return nil if possible?(root, visited).nil?

    visited.push(root)
    p visited
    left_up = [root[0] - 2, root[1] + 1]
    left_down = [root[0] - 2, root[1] - 1]
    right_up = [root[0] + 2, root[1] + 1]
    right_down = [root[0] + 2, root[1] - 1]
    up_left = [root[0] - 1, root[1] + 2]
    up_right = [root[0] + 1, root[1] + 2]
    down_left = [root[0] - 1, root[1] - 2]
    down_right = [root[0] + 1, root[1] - 2]

    Knight.new(root,
               build_path(possible?(left_up, visited), visited),
               build_path(possible?(left_down, visited), visited),
               build_path(possible?(right_up, visited), visited),
               build_path(possible?(right_down, visited), visited),
               build_path(possible?(up_left, visited), visited),
               build_path(possible?(up_right, visited), visited),
               build_path(possible?(down_left, visited), visited),
               build_path(possible?(down_right, visited), visited))
  end

  def possible?(root, visited)
    return nil if root.nil?
    
    if root[0].negative? || root[0] > width - 1
      nil
    elsif root[1].negative? || root[1] > height - 1
      nil
    elsif visited.include?(root)
      nil
    else
      root
    end
  end

  # def pre_order(root = @root, array = [], &block)
  #   return if root.nil?

  #   if block.nil?
  #     array.push root.coordinates
  #   else
  #     block.call root.coordinates
  #   end
  #   pre_order(root.left_up, array, &block)
  #   pre_order(root.left_down, array, &block)
  #   pre_order(root.right_up, array, &block)
  #   pre_order(root.right_down, array, &block)
  #   pre_order(root.up_left, array, &block)
  #   pre_order(root.up_right, array, &block)
  #   pre_order(root.down_left, array, &block)
  #   pre_order(root.down_right, array, &block)
  #   array if block.nil?
  # end


  def level_order(coordinates)
    queue = []
   queue.push(@root)
   array = []
   until queue == []
      node = queue.shift
      next if node.nil?

     if block_given?
       yield node.data
      else
       array.push(node)
       break if node.coordinates == coordinates
      end
      queue.push(node.left_up, node.left_down,
                node.right_up, node.right_down,
                node.up_left, node.up_right,
                node.down_left, node.down_right)
    end
   array unless block_given?
  end

  def find_whole_path(coordinates)
    array = [coordinates]
    pointer = coordinates
    until array.include?(root.coordinates)
      array_to_check = level_order(pointer)
      array_to_check.reverse_each do |element|
        if !element.left_up.nil? && element.left_up.coordinates == pointer ||
          !element.left_down.nil? && element.left_down.coordinates == pointer ||
          !element.right_up.nil? && element.right_up.coordinates == pointer ||
          !element.right_down.nil? && element.right_down.coordinates == pointer ||
          !element.up_left.nil? && element.up_left.coordinates == pointer ||
          !element.up_right.nil? && element.up_right.coordinates == pointer ||
          !element.down_left.nil? && element.down_left.coordinates == pointer ||
          !element.down_right.nil? && element.down_right.coordinates == pointer
          array.push(element.coordinates)
          p array
          pointer = element.coordinates
        end
      end
    end
    array
  end


end
