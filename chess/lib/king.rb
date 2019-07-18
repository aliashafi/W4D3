require_relative "piece"
require_relative "../modules/stepable"

class King < Piece
  include Stepable
  OFFSETS = [
    [-1, 1],
    [0, 1],
    [1, 1],
    [1, 0],
    [ 1, -1],
    [ 0, -1],
    [ -1, -1],
    [ -1, 0]
  ]
  
  def symbol
    :K
  end

  def move_diffs
    OFFSETS
  end

  def test
    moves
  end

end 

if $PROGRAM_NAME == __FILE__
  new_board = Board.new
  rookie = King.new('red',new_board, [0,0])
  p rookie.test
end