require_relative "board"
require "colorize"
require "colorized_string"
require_relative 'cursor'


class Display
  attr_reader :board, :cursor
  def initialize(board, cursor)
    @cursor = cursor #Cursor.new([0,0], board)
    @board = board
  end

  def render
    #display symbol of each piece unless it's nil in which case empty string
    board.rows.each_with_index do |row, idx1|
      rendered_row = []
      row.each_with_index do |piece, idx2|
        if cursor.cursor_pos == [idx1, idx2]
          if cursor.toggle_selected
            rendered_row << piece.symbol.to_s.colorize(:color => piece.color, :background => :light_black)
          else
            rendered_row << piece.symbol.to_s.colorize(:color => piece.color, :background => :light_green)
          end
        else
          if idx1.even?
            rendered_row << piece.symbol.to_s.colorize(:color => piece.color, :background => :light_magenta) if idx2.even?
            rendered_row << piece.symbol.to_s.colorize(:color => piece.color, :background => :light_blue) if idx2.odd?
          else
            rendered_row << piece.symbol.to_s.colorize(:color => piece.color, :background => :light_magenta) if idx2.odd?
            rendered_row << piece.symbol.to_s.colorize(:color => piece.color, :background => :light_blue) if idx2.even?
          end
        end
      end
      #cursor 
      puts rendered_row.join('')
    end
  end
end

