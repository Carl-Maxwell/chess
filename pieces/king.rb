
class King < Piece
  include Steppable

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
  def try_moves
    KING
  end

  def king?
    true
  end

  def to_s
    #"♔"
    self.color == :white ? "♚ ".white : "♚ ".blue
  end

  def move(to_here)
    super
  end

  # def possible_moves
    # moves = super
    # back_rank = board.row(self.color == :white ? 7 : 0)

    # left_rook, right_rook = back_rank[0], back_rank[7]

    # if !self.moved && !left_rook.moved && back_rank[1..3].none?(&:piece?)
    #   unless board.in_check?(self.color)
    #     dupped_board = board.deep_dup
    #     dupped_board.move!(self.position, Vector.new([0, -1]) + self.position)
    #     unless dupped_board.in_check?(self.color)
    #       moves << Vector.new([0, -2]) + self.position
    #     end
    #   end
    # end

    # moves
  # end
end
