# Game_state file tracks information on the game for easy access by player and gameboard access
# 
class Game_State
  attr_accessor :turn, :free_parking_cash, :game_log

  def initialize
    @turn = 0
    @free_parking_cash = 0
    @game_log = [] 
  end

  def next_turn
    @turn += 1 
  end

  def update_game_log(action)
    @game_log.append(action)
  end

  def post_game_summary(players)
    players.each do |player|
      player.cash_on_hand
      player.current_holdings      
      player.count_sets      
    end      
  end

  def check_for_losers(player)
      if player.cash <= 0
        player.lose_game
      end    
  end
  
end

