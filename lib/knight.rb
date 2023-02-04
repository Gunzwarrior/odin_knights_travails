# frozen_string_literal: true

# Class reprensenting the possible knight moves
class Knight
  attr_accessor :coordinates, :left_up, :left_down, :right_up,
                :right_down, :up_left, :up_right, :down_left, :down_right

  def initialize(coordinates)
    @coordinates = coordinates
    @left_up = nil
    @left_down = nil
    @right_up = nil
    @right_down = nil
    @up_left = nil
    @up_right = nil
    @down_left = nil
    @down_right = nil
  end
end
