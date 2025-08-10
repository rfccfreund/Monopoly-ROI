# Configuration file for Monopoly simulation
module Config
  # Simulation settings
  NUM_SIMULATIONS = 100
  NUM_GAMES_PER_SIMULATION = 100
  
  # Game settings
  STARTING_CASH = 800
  GO_BONUS = 200
  BOARD_SIZE = 40
  
  # Player settings
  NUM_PLAYERS = 3
  PLAYER_NAMES = ["John", "Mary", "Sally"]
  
  # Game end conditions
  MIN_PLAYERS_TO_CONTINUE = 1
  
  # Property settings
  HOUSE_COST = 100
  MAX_HOUSES = 4
  
  # File paths
  OUTPUT_FILE = "monopoly_returns.csv"
  
  # Property data - could be moved to a separate data file
  PROPERTIES = [
    "Med", "Baltic", "RR", "Ori Ave", "Vermont", "Connecticut", 
    "Charles Place", "EE", "States Ave", "Virginia", "Penn Rail", 
    "St. James", "Tenn Ave", "NY Ave", "Ken Ave", "Indiana", 
    "Illinois", "B&O Rail", "Atlantic Ave", "Ventnor Ave", "WW", 
    "Marvin Gardins", "Pacific Ave", "NC Ave", "Penn Ave",
    "Short Line", "Park Place", "Boardwalk"
  ]
end 