require_relative 'knight'

class Board

  attr_accessor :width, :height
  attr_reader :root
  def initialize(root = [0, 0], width = 8, height = 8)
    @width = width
    @height = height
    @root = build_path(root)
  end

  def build_path(root, visited = [])
    return nil if possible?(root, visited).nil?

    visited.push(root)
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
end
