require './player'
require './tile'
require './forge'


# Returns an array which contains an array of property returns for each game played  
def run_simulation(number, debug=false)
  all_returns = []

  number.times do
    players = create_players()
    game_board = create_gameboard()
    all_returns << play_game(players, 100, game_board, debug)
  end

  return all_returns
end


# returns an array of each properties revenue / cost
def play_game(players, rounds, game_board, debug) 
    prop_returns = []
    
    rounds.times {   
      players.each do |player| 
        player.roll_dice
        loc = game_board[player.position]       
        eval_tile(loc, player, game_board)        
      end       
    }

    if debug == true
      players.each do |player| player.current_holdings end 
    
    end
    

    game_board.each do |prop|
        puts prop.info
        if (prop.is_a?(Property) or prop.is_a?(Railroad) or prop.is_a?(Utility))
          puts prop.return_on_investment
          prop_returns << prop.return_on_investment             
        end
      end
  prop_returns  
end

# central game logic which implements the logic of each tile in the gameboard
def eval_tile(tile, player, game_board)
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
      player.holdings.each do |prop|
        if prop.is_a?(Railroad)
          prop.add_railroad
        end
      end
    else
      player.pay_player(tile.rent, tile.is_owned)
      tile.generate_income
    end  

  when 'Utility'
    unless tile.is_owned
      player.purchase(tile)
      player.holdings.each do |prop|
        if prop.is_a?(Utility)
          prop.add_utility
        end
      end
    else
      player.charge_player(tile.rent, tile.is_owned)
      tile.generate_income
    end  

  when 'Go'
    tile.pass_go(player)

  when 'Jail'
    if player.debug
      puts "Welcome to the big house"
    end

  when 'Chance'
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
  
  
  
  
