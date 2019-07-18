module Slideable
  private
  HORIZONTAL_DIRS = [
      [0,1], [0,2], [0,3], [0,4], [0,5], [0,6], [0,7],
      [0,-1], [0,-2], [0,-3], [0,-4], [0,-5], [0,-6], [0,-7],
      [1,0], [2,0], [3,0], [4,0], [5,0], [6,0], [7,0],
      [-1,0], [-2,0], [-3,0], [-4,0], [-5,0], [-6,0], [-7,0]
    ]

  DIAGONAL_DIRS = [
    [0,0],[1,1],[2,2], [3,3], [4,4], [5,5], [6,6],[7,7],
    [0,7],[1,6],[2,5], [3,4], [4,3], [5,2], [6,1],[7,0]
  ]
  public
  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    dirs = self.move_dirs # give us offsets for piece
    current_pos = self.pos #current_pos
    all_moves = []
    dirs.each do |offset|
      all_moves << [current_pos[0] + offset[0], current_pos[1] + offset[1]] 
    end

    ##reject moves off the board.. invalid_moves
    all_moves.select! {|mov| self.board.valid_pos?(mov)}
    
    all_moves.select! do |mov| 
      piece_pos = self.board[self.pos]
      piece_pos.color != self.color
    end

    ## reject moves where the board already has a player of the same color
    
    ## reject everything after all of these 
    ## reject everything after a piece of opp color
    all_moves
  end

  def move_dirs 
  end

  def grow_unblocked_moves_in_dir(dx,dy)
  end

  


end