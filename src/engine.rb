require './player'
require './tile'


def play_game(players, rounds, game_board) 
    prop_returns = []

    rounds.times {   
      players.each do |player| 
        player.roll_dice
        loc = game_board[player.position.to_s]
        unless loc.is_owned
        player.purchase(loc)      
        else
        player.pay_player(loc.rent, loc.is_owned)
        loc.generate_income
        end
        puts "\n"
        player.status
      end 
    }
    game_board.each do |key, value|
        puts value.info
        puts value.return_on_investment
        prop_returns << value.return_on_investment
    end

  prop_returns  
end


    