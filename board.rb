require_relative 'square'
require_relative 'pieces'
require 'colorize'

class Board
  attr_accessor :board, :debug_piece

  def initialize
    @board = Array.new(8) { Array.new(8) { EmptySquare.new } }
  end

  def lime?(coord)
    self.debug_piece && self.debug_piece.valid_moves.include? coord
  end

  def render
    color = true
    @board.each.with_index do |row, row_i|
      color = !color
      row.each.with_index do |square_or_piece, col_i|
        color = !color
        str = square_or_piece.piece? ? square_or_piece.to_s : "  "
        if lime?([row_i, col_i])
          print(str.on_green)
        else
          color ? print(str.on_red) : print(str.on_black)
        end
      end
      puts
    end
    ""
  end

  def populate
    populate_pawns
    populate_back_rank(0, :black)
    populate_back_rank(7, :white)
  end

  def populate_pawns
    self.board[1].each_with_index do |square, index|
      self.board[1][index] = Pawn.new(:black, self, [1, index])
    end
    self.board[6].each_with_index do |square, index|
      self.board[6][index] = Pawn.new(:white, self, [6, index])
    end
  end

  def populate_back_rank(row, color)
    self[row, 0] = Rook.new(color, self, [row, 0])
    self[row, 1] = Knight.new(color, self, [row, 1])
    self[row, 2] = Bishop.new(color, self, [row, 2])
    self[row, 3] = Queen.new(color, self, [row, 3])
    self[row, 4] = King.new(color, self, [row, 4])
    self[row, 5] = Bishop.new(color, self, [row, 5])
    self[row, 6] = Knight.new(color, self, [row, 6])
    self[row, 7] = Rook.new(color, self, [row, 7])
  end

  def [](row, col)
    board[row][col]
  end

  def []=(row, col, value)
    board[row][col] = value
  end

  def on_board?(pos)
    (0..7).to_a.include?(pos[0]) && (0..7).to_a.include?(pos[1])
  end

  def occupied?(pos)
    self[ *pos ].piece?
  end

  def move(from_here, to_here)
    self[ *to_here ] = self[ *from_here ]
    self[ *to_here ].position = to_here
    self[ *from_here ] = EmptySquare.new
  end

end
