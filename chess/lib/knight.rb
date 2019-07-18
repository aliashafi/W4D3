require_relative "piece"
require_relative "../modules/stepable"

class Knight < Piece
  include Stepable
  OFFSETS = [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
  ]

  def symbol
    :N
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
  rookie = Knight.new('red',new_board, [0,0])
  p rookie.test
end