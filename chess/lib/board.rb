require_relative 'piece'
require_relative 'rook'
require_relative 'queen'
require_relative 'bishop'
require_relative 'king'
require_relative 'knight'
require_relative 'pawn'
require_relative 'null_piece'
require_relative 'cursor'
require_relative 'display'

# require 'colorize'


class Board
  attr_reader :rows

  
  def initialize
    @rows = Array.new(8) {Array.new(8, nil)}


    @rows[1].each_with_index {|p,i| @rows[1][i] = Pawn.new(:black, self, [1,i])}
    black_rook_1 = Rook.new(:black,self,[0,0])
    black_knight_1 = Knight.new(:black,self,[0,1])
    black_bishop_1 = Bishop.new(:black,self,[0,2])
    black_king = King.new(:black,self,[0,3])
    black_queen = Queen.new(:black,self,[0,4])
    black_bishop_2 = Bishop.new(:black,self,[0,5])
    black_knight_2 = Knight.new(:black,self,[0,6])
    black_rook_2 = Rook.new(:black,self,[0,7])

    @rows[6].each_with_index {|p,i| @rows[6][i] = Pawn.new(:white, self, [6,i])}
    white_rook_1 = Rook.new(:white,self,[7,0])
    white_knight_1 = Knight.new(:white,self,[7,1])
    white_bishop_1 = Bishop.new(:white,self,[7,2])
    white_king = Queen.new(:white,self,[7,3])
    white_queen = King.new(:white,self,[7,4])
    white_bishop_2 = Bishop.new(:white,self,[7,5])
    white_knight_2 = Knight.new(:white,self,[7,6])
    white_rook_2 = Rook.new(:white,self,[7,7])

    @rows[0][0] = black_rook_1
    @rows[0][1] = black_knight_1
    @rows[0][2] = black_bishop_1
    @rows[0][3] = black_king
    @rows[0][4] = black_queen
    @rows[0][5] = black_bishop_2
    @rows[0][6] = black_knight_2
    @rows[0][7] = black_rook_2

    @rows[7][0] = white_rook_1
    @rows[7][1] = white_knight_1
    @rows[7][2] = white_bishop_1
    @rows[7][3] = white_king
    @rows[7][4] = white_queen
    @rows[7][5] = white_bishop_2
    @rows[7][6] = white_knight_2
    @rows[7][7] = white_rook_2

    @rows.each_with_index do |raw, idx1|
      raw.each_with_index do |place, idx2|
        if place.nil?
          @rows[idx1][idx2] = NullPiece.instance
        end
      end
    end

    @sentinel = NullPiece.instance
  end

  def [](pos)
    row, col = pos
    self.rows[row][col]
  end

  def []=(pos, val)
    row, col = pos
    self.rows[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos] == NullPiece.instance #if no piece at start
      raise "There is no piece here"
    end
    #move piece and set start to nullpiece
    start_piece = self[start_pos]
    self[start_pos] = NullPiece.instance
    self[end_pos] = start_piece
  end

  def valid_pos?(pos)
    pos[0] > -1 && pos[0] < 8 && pos[1] > -1 && pos[1] < 8
  end

  def add_piece(piece, pos)

  end

  def checkmate?(color)

  end

  def in_check?(color)
    
  end

  def find_king(color)
    return white_king.pos if white_king.color == color
    return black_king.pos if black_king.color == color
  end

  def pieces

  end

  def dup

  end

end

if $PROGRAM_NAME == __FILE__
  test = Board.new
  curse = Cursor.new([0,0], test)
  # p test
  display = Display.new(test, curse)
  display.render
  # test.move_piece([0,0],[3,0])
  # display.render
  rookie = test.rows[0][0]
  p rookie.moves
  
end