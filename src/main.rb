require './engine'
require './forge'

# Game loop:
# player rolls dice
# players position is updated and corresponding tile is looked at
# naive policy is purchase everything
# player purchases or pays
# other players take turns
# next round 

# TODO

# update gameboard and player movement function
# revist return function and map to tiles

all_returns = []

100.times do
  players = create_players()
  game_board = create_gameboard()
  all_returns << play_game(players, 100, game_board)
end

all_returns = all_returns.transpose
all_returns.each do 
    |game|
    puts game.inject{ |sum, num| sum + num}.to_f / game.size
end