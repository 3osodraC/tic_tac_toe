# stores and manipulates the game's board and plays.
class Board
  WIN_STATES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9], # horizontal
    [1, 4, 7], [2, 5, 8], [3, 6, 9], # vertical
    [1, 5, 9], [3, 6, 7]             # diagonal
  ].freeze

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
end
