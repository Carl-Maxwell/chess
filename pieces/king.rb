
class King < Piece
  include Steppable

  def try_moves
    KING
  end

  def to_s
    #"♔"
    self.color == :white ? "♚ ".white : "♚ ".blue
  end
end
