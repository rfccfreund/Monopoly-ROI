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
  case tile.class.to_s

  when 'Property'
    unless tile.is_owned
      player.purchase(tile)      
    else
      player.pay_player(tile.rent, tile.is_owned)
      tile.generate_income
    end

  when 'Railroad'
    unless tile.is_owned
      player.purchase(tile)      
    else
      player.pay_player(tile.rent, tile.is_owned)
      tile.generate_income
    end

  when 'Go'
    tile.pass_go(player)

  when 'Jail'
   puts "Welcome to the big house"

  when Chance
    player.draws_event(tile)
    new_loc = game_board[player.position]
    if tile != new_loc and new_loc.is_a?(Property)
      unless new_loc.is_owned
        player.purchase(new_loc)      
      else
        player.pay_player(new_loc.rent, new_loc.is_owned)  
        new_loc.generate_income
      end
    end

  when 'Community'
    player.draws_event(tile)
    new_loc = game_board[player.position]
    if tile != new_loc and new_loc.is_a?(Property)
      unless new_loc.is_owned
        player.purchase(new_loc)      
      else
        player.pay_player(new_loc.rent, new_loc.is_owned)  
        new_loc.generate_income
      end
    end
    
  else
    puts "Another tile type" 

  end

  player.cash_on_hand  
end 
  
  
  
  
