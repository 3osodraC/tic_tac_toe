# contains the methods to play the game.
class Game
  WIN_STATES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9], # horizontal
    [1, 4, 7], [2, 5, 8], [3, 6, 9], # vertical
    [1, 5, 9], [3, 6, 7]             # diagonal
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
      show_board
      play = ''
      # play validation, i.odd? are player1's turns
      if i.odd?
        play = prompt_play(@player1_name)
        @player1_plays.push play
        @board[play - 1] = 'X'
        break if win?(@player1_name, @player1_plays)
      else
        play = prompt_play(@player2_name)
        @player2_plays.push play
        @board[play - 1] = 'O'
        break if win?(@player2_name, @player2_plays)
      end
      i += 1
    end
  end

  def play
    prompt_names
    puts 'Make your play by picking a number between 1 and 9.'
    make_plays
    show_board
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
    until prompt.match(/[1-9]/) && prompt.size == 1 && !@player1_plays.include?(prompt)
      print "#{player_name}, it's your turn!\nPlay: "
      prompt = gets.chomp
    end
    prompt.to_i
  end

  def show_board
    puts '----------------------------------------------------'
    puts "\n #{@board[0]} | #{@board[1]} | #{@board[2]} \n---+---+---"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} \n---+---+---"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} \n\n"
  end

  def win?(name, plays)
    WIN_STATES.each do |item|
      p item
      p plays
      # this doesn't work. maybe make a copy of plays, remove all unmatching
      # items and check if they are identical?
      if plays.include?(item)
        @winner = name
        return true
      end
    end
    false
  end
end

game = Game.new
game.play
