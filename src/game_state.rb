# Game_state file tracks information on the game for easy access by player and gameboard access
# 
class Game_State
  attr_accessor :turn, :free_parking_cash, :game_log

  def initialize
    @turn = 0
    @free_parking_cash = 0
    @game_log = []
    @num_losers = 0 
    @game_over = false
  end

  def next_turn
    @turn += 1 
  end

  def update_game_log(action)
    @game_log.append(action)
  end

  def post_game_summary(players)
    puts @num_losers
    players.each do |player|      
      player.cash_on_hand
      player.current_holdings      
      player.count_sets      
    end
  end

  def check_for_losers(player)
      if player.cash <= 0
        player.lose_game!
        @num_losers += 1         
      end    

      if @num_losers == 2
        @game_over = true    
      end
  end

  def game_over?      
    return @game_over
  end
  
end

