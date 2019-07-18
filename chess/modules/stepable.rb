module Stepable

  def moves
    dirs = self.move_diffs # give us offsets for piece
    current_pos = self.pos #current_pos
    all_moves = []
    dirs.each do |offset|
      all_moves << [current_pos[0] + offset[0], current_pos[1] + offset[1]] 
    end
    all_moves
  end

  private
  def move_diffs
  end
end