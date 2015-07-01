class Knight < Piece
  include Steppable

  def try_moves
    KNIGHT
  end
  def to_s
    self.color == :white ? "♞ ".white : "♞ ".blue
  end
end
