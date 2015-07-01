module Slideable

  RANK = [[1, 0], [-1, 0]]
  FILE = [[0, 1], [0, -1]]
  DIAGONAL = [[-1,-1], [-1, 1], [1, -1], [1, 1]]

  def valid_moves

    moves = []
    self.try_moves.each do |direction|
      # debugger
      coord1, coord2 = position[0] + direction[0], position[1] + direction[1]
       while self.board.on_board?([coord1, coord2]) && !self.board[coord1, coord2].ally?(color)

          moves << [coord1, coord2]
          coord1 += direction[0]
          coord2 += direction[1]
          if self.board.on_board?([coord1, coord2]) && self.board[coord1, coord2].piece? && !self.board[coord1, coord2].ally?(color)
            moves << [coord1, coord2]
            break
          end
        end
    end
    moves
  end


end
