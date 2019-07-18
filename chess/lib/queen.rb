require_relative "piece"
require_relative "../modules/slideable"

class Queen < Piece
  include Slideable

  def symbol
    :Q
  end

  def move_dirs
    horizontal_dirs.concat(diagonal_dirs)
  end

  def test
    moves
  end

  
  
end

if $PROGRAM_NAME == __FILE__
  new_board = Board.new
  rookie = Queen.new('red',new_board, [0,0])
  p rookie.test
end