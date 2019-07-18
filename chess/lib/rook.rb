require_relative "./piece"
require_relative "../modules/slideable"
# require_relative "board" ##DELETE THIS LINE

class Rook < Piece
  include Slideable
  
  def move_dirs
    horizontal_dirs 
  end

  def symbol
    :R
  end
  
end

if $PROGRAM_NAME == __FILE__
  # new_board = Board.new
  # new_board.render
  # display = Display.new(new_board, curse)
  # rookie = Rook.new(:black,new_board, [3,3])
  # p rookie.moves
end