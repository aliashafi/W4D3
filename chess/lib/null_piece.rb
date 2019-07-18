require_relative "piece"
require_relative "../modules/slideable"
require "singleton"

class NullPiece < Piece
  include Singleton
  attr_reader :color
  def initialize
    @color = :light_magenta
    
  end

  def moves 
    ""
  end

  def symbol
    :' '
  end




end