require './tile'

def create_gameboard 
  game_board = [
  go = Go.new("Go"), # Space 0
  med_ave  = Property.new("Med Ave", 60, 2),
  com_chest_1 = Community.new("Community Chest"),
  baltic_ave = Property.new("Baltic Ave", 60, 4),  
  income_tax = Jail.new("Income Tax"), 
  read_rail = Property.new( "Reading Railroad", 200,  25), # Space 5
  ori_ave = Property.new("Oriental Avenue", 100, 6),
  chance_1 = Chance.new("Chance"),
  vermont_ave = Property.new("Vermont Avenue", 100, 6),
  connecticut_Ave = Property.new("Connecticut Avenue", 120, 8),
  jail = Jail.new("Jail"), # Space 10
  st_charles_place = Property.new("Charles Place", 140, 10),  
  elec_company = Property.new("Electric Company", 150, 75), 
  states_ave = Property.new("States Avenue", 140, 10),
  virgina_ave = Property.new( "Virginia Avenue", 160, 12),
  penn_rail = Property.new( "Pennsylvania Railroad", 200, 25), # Space 15
  st_james_place = Property.new( "St. James Place", 180,14),
  com_chest_2 = Community.new("Community Chest"), 
  tenn_ave = Property.new( "Tennessee Avenue", 180, 14),
  ny_ave = Property.new("New York Avenue", 200, 16),
  free_parking = Free_Parking.new("Free Parking"), # Space 20
  kent_ave = Property.new( "Kentucky Avenue", 220, 18),
  chance_2 = Chance.new("Chance"), 
  indiana_ave = Property.new( "Indiana Avenue", 220,  18),
  illinois_ave = Property.new( "Illinois Avenue", 240, 20),
  bo_rail = Property.new( "B. & O. Railroad", 200,  25), # Space 25
  atlantic_ave = Property.new( "Atlantic Avenue",  260, 22),
  ventor_ave = Property.new( "Ventnor Avenue", 260,  22), 
  water_works = Property.new( "Water Works",  150,  75),
  marvin_gardens = Property.new( "Marvin Gardens",  280,  24),
  go_to_jail = Go_To_Jail.new("Go To Jail"), # Space 30
  pacific_ave = Property.new( "Pacific Avenue",  300, 26),
  nc_avenue = Property.new( "North Carolina Avenue",  300,  26), 
  com_chest_3 = Community.new("Community Chest"),
  penn_ave = Property.new( "Pennsylvania Avenue",  320, 28),
  short_line_rail = Property.new( "Short Line", 200, 25), # Space 35
  chance_3 = Chance.new("Chance"),
  park_place = Property.new( "Park Place", 350,  35), 
  lux_tax = Jail.new("Luxury Tax"),
  boardwalk = Property.new( "Boardwalk", 400,  50) # Space 39 + Go = 40
]                 
  
end

def create_players
    players = []
    player1 = Player.new("John")
    player2 = Player.new("Mary")
    player3 = Player.new("Sally")
  
    players << player1 
    players << player2
    players << player3


    players
end

test_tile1 = Property.new("Test 1", 50, 5)
test_tile2 = Property.new("Test 2", 50, 15)
test_tile3 = Property.new("Test 3", 70, 5)
test_tile4 = Property.new("Test 4", 50, 5)
test_tile5 = Property.new("Test 5", 50, 5)
test_tile6 = Property.new("Test 6", 50, 5)
test_tile7 = Property.new("Test 7", 50, 5)
test_tile8 = Property.new("Test 8", 50, 5)
test_tile9 = Property.new("Test 9", 50, 5)
test_tile10 = Property.new("Test 10", 50, 5)
test_tile11 = Property.new("Test 11", 50, 5)
test_tile12 = Property.new("Test 12", 50, 5)