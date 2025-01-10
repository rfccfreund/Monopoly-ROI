# Game_state file tracks information on the game for easy access by player and gameboard access
# 
class Game_State
  attr_accessor :turn, :free_parking_cash, :game_log

  def initialize
    @turn = 0
    @free_parking_cash = 0
    @game_log = [] 
  end

  
end

