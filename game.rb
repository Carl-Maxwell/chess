require 'io/console'
require_relative 'board'
require_relative 'vector'
require_relative 'player'

class Game
  attr_reader :board, :white, :black
  attr_accessor :cursor, :quit, :current_player

  def initialize
    @cursor = [4,4]
    @board = Board.new
    board.populate
    @quit = false
    @white = Player.new(:white)
    @black = Player.new(:black)
    @current_player = @white
  end

  def get_movement(character)
    controls = {"w" => [-1,0], "a" => [0, -1], "s" => [1,0], "d" => [0,1] }

    if controls.include?(character)
      controls[character]
    else
      return [0,0]
    end
  end

  def display_board(cursor)
    board.render(cursor)
  end

  def make_turn(color)
    character = STDIN.getch

    self.cursor = Vector.new(self.cursor) + get_movement(character)

    # do the other stuff
    piece = board[ *self.cursor ]

    functions = {" " => ??, "\u007F" => ??, "q" => ??}

    if character == " "
      if piece.piece? && piece.color == color
        board.currently_selected_piece = piece
      elsif board.currently_selected_piece.piece?
        if board.currently_selected_piece.move(self.cursor)
          swap_players
          board.currently_selected_piece = board.sentinel
        end
      end

    elsif character == "q"
      self.quit = true
    end
  end

  def swap_players
    self.current_player = self.current_player == white ? black : white
  end

  def cursor=(coord)
    @cursor = coord if board.on_board?(coord)
  end

  def game_over?
    self.quit
  end

  def play
    until game_over?
      system("clear")
      display_board(self.cursor)
      make_turn(self.current_player.color)
    end
    self.quit = false
  end
end
