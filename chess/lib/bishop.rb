require_relative "piece"
require_relative "../modules/slideable"
class Bishop < Piece
  include Slideable
  def symbol
    :B
  end

  def move_dirs
    diagonal_dirs
  end

  def test
    moves
  end

  
  
end

if $PROGRAM_NAME == __FILE__
  new_board = Board.new
  rookie = Bishop.new('red',new_board, [0,0])
  p rookie.test
end