# contains the methods to play the game.
class Game
  WIN_STATES = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # horizontal
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # vertical
    [0, 4, 8], [2, 5, 6]             # diagonal
  ].freeze

  def initialize
    @player1 = { name: nil, plays: [] }
    @player2 = { name: nil, plays: [] }
    @board = Array.new(9)
  end

  # def play

  def prompt_names
    print "Please enter you names\n(X) Player 1: "
    @player1[:name] = gets.chomp
    print '(O) Player 2: '
    @player2[:name] = gets.chomp
  end

  def prompt_play
    prompt = ''
    until prompt.match(/[0-8]/) && prompt.size == 1
      prompt = gets.chomp
      prompt.match?(/[0-8]/)
      p prompt
    end
    prompt.to_i
  end

  def validate_play
    # code here
  end
end

game = Game.new
game.prompt_plays
