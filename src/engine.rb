require './player'
require './tile'



def play_game(players, rounds, game_board) 
    prop_returns = []
    
    rounds.times {   
      players.each do |player| 
        player.roll_dice
        loc = game_board[player.position]       
        eval_tile(loc, player, game_board)        
      end       
    }
    players.each do |player| player.current_holdings end 

    game_board.each do |prop|
        puts prop.info
        if prop.is_a?(Property)
          puts prop.return_on_investment
          prop_returns << prop.return_on_investment          
        end
      end
  prop_returns  
end


def eval_tile(tile, player, game_board) # can replace entire eval function with match statement 
  unless tile.is_a?(Go) or tile.is_a?(Jail)
    unless tile.is_a?(Chance) or tile.is_a?(Community) or tile.is_a?(Free_Parking) or tile.is_a?(Jail) or tile.is_a?(Go_To_Jail)
      unless tile.is_owned
        player.purchase(tile)      
      else
        player.pay_player(tile.rent, tile.is_owned)
        tile.generate_income
      end
      player.cash_on_hand
    else
      player.draws_event(tile)
      new_loc = game_board[player.position]
      if tile != new_loc and new_loc.is_a?(Property)
        unless new_loc.is_owned
          player.purchase(new_loc)      
        else
          player.pay_player(new_loc.rent, new_loc.is_owned)  
          new_loc.generate_income
        end
        player.cash_on_hand              
      end
    end 
  else
    if tile.is_a?(Go)    
      tile.pass_go(player)
    end
  end  
end