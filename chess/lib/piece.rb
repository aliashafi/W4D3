# require_relative "board"

class Piece
  attr_reader :color, :board
  attr_accessor :pos
  def initialize(color, board, pos)
    @color = color.to_sym
    @board = board
    @pos = pos
  end

  def to_s

  end

  def empty?

  end

  def valid_moves
     
  end

  def pos=(val)
    row, col = val
    @pos = row, col
  end

  def symbol

  end

  private
  def move_into_check?(end_pos)

  end
end
