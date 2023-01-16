=begin
knight class
- occupy a set of possible coordinates (0..width-1, 0..height-1)  
- next possible moves = x+1,y+2 / x+1,y-2 / x-1,y+2 / x-1,y-2
                      x+2,y+1 / x+2,y-1 / x-2,y+1 / x-2,y-1
- all those moves are attributes set to the coordinates or nil
  if out of bounds or already traveled

- not possible if outside possible coordinates or already went there
- max total move/branch width*height-1 (starting position)
- keep array of already traveled 
- stop at set coordinates
- find shortest route = shortest array
- display said array to show shortest route

=end
class Knight
def initialize(coordinates, left_up = nil, left_down = nil,
               right_up = nil, right_down = nil, up_left = nil,
               up_right = nil, down_left = nil, down_right = nil)
  @coordinates = coordinates
  @left_up = left_up
  @left_down = left_down
  @right_up = right_up
  @right_down = right_down
  @up_left = up_left
  @up_right = up_right
  @down_left = down_left
  @down_right = down_right
end
end