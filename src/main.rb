require './player'
require './tile'

# TODO
# Create game map using hashmap and Tile objects

# TODO 
# Game loop:
# player rolls dice
# players position is updated and corresponding tile is looked at
# naive policy is purchase everything
# player purchases or pays
# other players take turns
# next round 


med_ave  = Property.new("Med Ave", 60, 2)
test_tile1 = Property.new("Test 1", 50, 5)
test_tile2 = Property.new("Test 2", 50, 5)
test_tile3 = Property.new("Test 3", 50, 5)
test_tile4 = Property.new("Test 4", 50, 5)
test_tile5 = Property.new("Test 5", 50, 5)
test_tile6 = Property.new("Test 6", 50, 5)
test_tile7 = Property.new("Test 7", 50, 5)
test_tile8 = Property.new("Test 8", 50, 5)
test_tile9 = Property.new("Test 9", 50, 5)
test_tile10 = Property.new("Test 10", 50, 5)
test_tile11 = Property.new("Test 11", 50, 5)
test_tile12 = Property.new("Test 12", 50, 5)

game_board = {'1' => test_tile1 , '2' => test_tile2 , '3' => test_tile3 , '4' => test_tile4 , '5' => test_tile5}

player1 = Player.new("John")

player1.roll_dice
unless game_board[player1.position.to_s].is_owned
    player1.purchase(game_board[player1.position.to_s])
end

player1.status


