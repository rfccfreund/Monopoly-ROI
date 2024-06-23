require './player'
require './tile'



def play_game(players, rounds, game_board) 
    prop_returns = []
    
    rounds.times {   
      players.each do |player| 
        player.roll_dice
        loc = game_board[player.position]
        unless loc.is_a?(Go) 
          unless loc.is_owned
          player.purchase(loc)      
          else
          player.pay_player(loc.rent, loc.is_owned)
          loc.generate_income
          end
          puts "\n"
          player.status
        else 
          loc.pass_go(player)
        end
      end 
    }
    game_board.each do |prop|
        puts prop.info
        unless prop.is_a?(Go)
          puts prop.return_on_investment
          prop_returns << prop.return_on_investment
        end
      end
  prop_returns  
end


    