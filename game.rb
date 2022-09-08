# contains the methods to play the game.
class Game
  WIN_STATES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9], # horizontal
    [1, 4, 7], [2, 5, 8], [3, 6, 9], # vertical
    [1, 5, 9], [3, 5, 7]             # diagonal
  ].freeze

  def initialize
    @player1_name = nil
    @player1_plays = []
    @player2_name = nil
    @player2_plays = []
    @winner = nil
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def make_plays
    i = 1
    while i < 10
      display_board
      move = ''
      # play validation, i.odd? are player1's turns
      if i.odd?
        move = prompt_play(@player1_name)
        @player1_plays.push move
        @board[move - 1] = 'X'
        break if win?(@player1_name, @player1_plays)
      else
        move = prompt_play(@player2_name)
        @player2_plays.push move
        @board[move - 1] = 'O'
        break if win?(@player2_name, @player2_plays)
      end
      i += 1
    end
  end

  def play
    prompt_names
    puts 'Make your play by picking a number between 1 and 9.'
    make_plays
    display_board
    puts "#{@winner} wins! Thank you for playing."
  end

  def prompt_names
    print "Please enter you names\n(X) Player 1: "
    @player1_name = gets.chomp
    print '(O) Player 2: '
    @player2_name = gets.chomp
  end

  def prompt_play(player_name)
    prompt = ''
    until valid_prompt?(prompt)
      print "#{player_name}, it's your turn!\nPlay: "
      prompt = gets.chomp
    end
    puts "\n"
    prompt.to_i
  end

  def display_board
    puts '----------------------------------------------------'
    puts "\n #{@board[0]} | #{@board[1]} | #{@board[2]} \n---+---+---"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} \n---+---+---"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} \n\n"
  end

  def valid_prompt?(prompt)
    valid = nil
    valid = true if prompt.match(/[1-9]/) && prompt.size == 1 && @board[prompt.to_i - 1].is_a?(Integer)
    valid
  end

  def win?(name, plays)
    WIN_STATES.each do |item|
      plays_dummy = []
      item.each do |i|
        plays_dummy << plays.select { |element| element == i }
      end
      plays_dummy.flatten!

      if plays_dummy.eql?(item)
        @winner = name
        return true
      end
    end
    false
  end
end

game = Game.new
game.play
