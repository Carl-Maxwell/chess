module Steppable

  KING = [
         [-1, -1],
         [-1, 0],
         [-1, 1],
         [0, 1],
         [1, 1],
         [1, 0],
         [1, -1],
         [0, -1]
  ]

  # sorted clockwise using row, column coordinates
  KNIGHT = [
             [-2,1],
             [-1,2],
             [1,2],
             [2,1],
             [2,-1],
             [1,-2],
             [-1,-2],
             [-2,-1],
  ]

  def valid_moves
    moves = []
    self.try_moves.each do |step|
      coord1, coord2 = self.position[0] + step[0], self.position[1] + step[1]
      unless self.board.on_board?([coord1, coord2]) && self.board[coord1, coord2].ally?(self.color)
        moves << [coord1, coord2]
      end
    end
    moves
  end

end
