# contains the methods to play the game.
class Game
  WIN_STATES = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # horizontal
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # vertical
    [0, 4, 8], [2, 5, 6]             # diagonal
  ].freeze

  def initialize
    @player1_name = nil
    @player1_plays = []
    @player2_name = nil
    @player2_plays = []
    @board = Array.new(9)
  end

  # def play

  def prompt_names
    print "Please enter you names\n(X) Player 1: "
    @player1_name = gets.chomp
    print '(O) Player 2: '
    @player2_name = gets.chomp
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

  def make_plays
    i = 1
    while i < 10
      prompt = prompt_play

      # play validation, i.odd? are always player1's turns
      unless @player1_plays.include?(prompt) && @player2_plays.include?(prompt)
        i += 1
        if i.odd?
          @player1_plays.push prompt
          p @player1_plays
        else
          @player2_plays.push prompt
          p @player2_plays
        end
      end
    end
  end
end

game = Game.new
game.make_plays
