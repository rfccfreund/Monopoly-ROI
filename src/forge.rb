require './tile'

# Object names are for clarity. Functionally the names don't get used
def create_gameboard 
  game_board = [
  go = Go.new("Go"), # Space 0
  med_ave  = Property.new("Med Ave", 60, [2, 10], :navy),
  com_chest_1 = Community.new("Community Chest"),
  baltic_ave = Property.new("Baltic Ave", 60, [4, 20], :navy),  
  income_tax = Jail.new("Income Tax"), 
  read_rail = Railroad.new( "Reading Railroad"), # Space 5
  ori_ave = Property.new("Oriental Avenue", 100, [6, 30], :light_blue),
  chance_1 = Chance.new("Chance"),
  vermont_ave = Property.new("Vermont Avenue", 100, [6, 30], :light_blue),
  connecticut_Ave = Property.new("Connecticut Avenue", 120, [8, 40], :light_blue),
  jail = Jail.new("Jail"), # Space 10
  st_charles_place = Property.new("Charles Place", 140, [10, 50], :brown),  
  elec_company = Utility.new("Electric Company"), 
  states_ave = Property.new("States Avenue", 140, [10, 50], :brown),
  virgina_ave = Property.new( "Virginia Avenue", 160, [12, 60], :brown),
  penn_rail = Railroad.new( "Pennsylvania Railroad"), # Space 15
  st_james_place = Property.new( "St. James Place", 180, [14, 70], :orange),
  com_chest_2 = Community.new("Community Chest"), 
  tenn_ave = Property.new( "Tennessee Avenue", 180, [14, 70], :orange),
  ny_ave = Property.new("New York Avenue", 200, [16, 80], :orange),
  free_parking = Jail.new("Free Parking"), # Space 20
  kent_ave = Property.new( "Kentucky Avenue", 220, [18, 90], :red),
  chance_2 = Chance.new("Chance"), 
  indiana_ave = Property.new( "Indiana Avenue", 220,  [18, 90], :red),
  illinois_ave = Property.new( "Illinois Avenue", 240, [20, 100], :red),
  bo_rail = Railroad.new( "B. & O. Railroad"), # Space 25
  atlantic_ave = Property.new( "Atlantic Avenue",  260, [22, 110], :yellow),
  ventor_ave = Property.new( "Ventnor Avenue", 260,  [22, 110], :yellow), 
  water_works = Utility.new( "Water Works"),
  marvin_gardens = Property.new( "Marvin Gardens",  280,  [24, 120], :yellow),
  go_to_jail = Go_To_Jail.new("Go To Jail"), # Space 30
  pacific_ave = Property.new( "Pacific Avenue",  300, [26, 130], :green),
  nc_avenue = Property.new( "North Carolina Avenue",  300,  [26, 130], :green), 
  com_chest_3 = Community.new("Community Chest"),
  penn_ave = Property.new( "Pennsylvania Avenue",  320, [28, 150], :green),
  short_line_rail = Railroad.new( "Short Line"), # Space 35
  chance_3 = Chance.new("Chance"),
  park_place = Property.new( "Park Place", 350,  [35, 175], :blue), 
  lux_tax = Jail.new("Luxury Tax"),
  boardwalk = Property.new( "Boardwalk", 400, [50, 200], :blue) # Space 39 + Go = 40
  ]                
  
  return game_board
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

def create_game_state
  Game_State.new()
end