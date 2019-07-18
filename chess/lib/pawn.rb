require_relative "piece"


class Pawn < Piece
  OFFSET_WHITE = [
    [1,0], [1,1], [1,-1]
  ]

  OFFSET_BLACK = [
    [-1,0], [-1,1], [-1,-1]
  ]

  def symbol
    :P
  end

  def move_dirs
    if self.color = :black
      dirs = OFFSET_BLACK
    else
      dirs = OFFSET_WHITE
    end
    current_pos = self.pos #current_pos
    all_moves = []
    dirs.each do |offset|
      all_moves << [current_pos[0] + offset[0], current_pos[1] + offset[1]] 
    end
    all_moves
  end

  def test
    moves
  end

  
  
end