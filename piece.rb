
class Piece
  attr_reader :color, :board
  attr_accessor :position

  def initialize(color, board, position)
    @color = color
    @board = board
    @position = position
  end

  def piece?
    true
  end

  def ally?(other_color)
    self.color == other_color
  end
end
