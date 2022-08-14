# contains the methods to play the game.
class Game
  WIN_STATES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9], # horizontal
    [1, 4, 7], [2, 5, 8], [3, 6, 9], # vertical
    [1, 5, 9], [3, 6, 7]             # diagonal
  ].freeze

  def initialize
    @player1 = nil
    @player2 = nil
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  # def play

  def prompt_names
    puts "Please enter you names\nPlayer 1: "
    @player1 = gets.chomp
    puts 'Player 2: '
    @player2 = gets.chomp
  end

  def prompt_plays
    # code here
  end
end
