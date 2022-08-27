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
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def make_plays
    i = 0
    while i < 9
      show_board
      prompt = ''
      # play validation, i.odd? are always player1's turns
      unless @player1_plays.include?(prompt) && @player2_plays.include?(prompt)
        i += 1
        if i.odd?
          prompt = prompt_play(@player1_name)
          @player1_plays.push prompt
          @board[prompt - 1] = 'X'
        else
          prompt = prompt_play(@player2_name)
          @player2_plays.push prompt
          @board[prompt - 1] = 'O'
        end
      end
    end
    show_board
  end

  # def play

  def prompt_names
    print "Please enter you names\n(X) Player 1: "
    @player1_name = gets.chomp
    print '(O) Player 2: '
    @player2_name = gets.chomp
  end

  def prompt_play(player_name)
    prompt = ''
    until prompt.match(/[1-9]/) && prompt.size == 1
      print "#{player_name}, it's your turn!\nPlay: "
      prompt = gets.chomp
    end
    prompt.to_i
  end

  def show_board
    puts 'Make your play by picking a number between 1 and 9.'
    puts "\n #{@board[0]} | #{@board[1]} | #{@board[2]} \n---+---+---"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} \n---+---+---"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} \n\n"
  end
end

game = Game.new
game.make_plays
