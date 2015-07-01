class Pawn < Piece
  attr_reader :moved

  def initialize(color, board, position)
    super
    @moved = false
  end

  def valid_moves
    moves = []

    displacement = color == :white ? -1 : 1
    coord = Vector.new(position)
    moves << [-2,0] if !moved && !board.occupied?(coord + [-2,0])
    moves << [-1,0] if !board.occupied?(coord + [-1,0]) && board.on_board?(coord + [-1,0])
    moves << [-1,-1] if board.on_board?(coord + [-1, -1]) && !board[*(coord + [-1,-1])].ally?(:white)
    moves << [-1,1] if board.on_board?(coord + [-1, 1]) && !board[*(coord + [-1,1])].ally?(:white)
    moves.map! { |move| coord + move }
    moves
  end

  def to_s
    self.color == :white ? "♟ ".white : "♟ ".blue
  end
end

class Vector
  def initialize(value)
    @store = value
  end

  def [](pos)
    @store[pos]
  end

  def +(other_value)
    other_value = Vector.new(other_value.to_a) if other_value.respond_to?(:to_a)

    [@store[0] + other_value[0], @store[1] + other_value[1]]
  end
end
