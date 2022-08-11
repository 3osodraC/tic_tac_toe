# stores all the game's data
class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2

    # board is stored in a 2d array, which represent the rows and columns
    # 0 = nothing, 1 = player1, 2 = player2
    @board ||= [[0, 0, 0][0, 0, 0][0, 0, 0]] # maybe another class for the board?
  end

  # def play
end
