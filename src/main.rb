require './engine'
require 'pp'
require 'csv'
require 'rover-df'

# Pregame setup
# num_of_simulations determines how many times the simulation is run
# num_of_games determines the number of games in each simulation
# Property names are feed into csv for column names
# all_simulation_returns list stores a list of the average value of each aggregate simulations returns
 
num_of_simulations = 100
num_of_games = 50
properties = ["Med", "Baltic", "RR", "Ori Ave", "Vermont", "Connecticut", "Charles Place", "EE", "States Ave", "Virginia", "Penn Rail", "St. James",
"Tenn Ave", "NY Ave", "Ken Ave", "Indiana", "Illinois", "B&O Rail", "Atlantic Ave", "Ventnor Ave", "WW", "Marvin Gardins", "Pacific Ave", "NC Ave", "Penn Ave",
"Short Line", "Park Place", "Boardwalk"]
all_simulation_returns = []


# Runs monopoly simulation x number of times and each simulation is comprised of y number of games
# naive policy is purchase everything 
num_of_simulations.times do
  avg_returns = []
  all_returns = run_simulation(num_of_games)

  # Game loop:
  # player rolls dice
  # players position is updated and corresponding tile evaluated
  # player purchases or pays
  # other players take turns
  # next round 

  # Prepares data for aggergation
  all_returns = all_returns.transpose

  all_returns.each do 
    |game|
    avg_returns << game.inject{ |sum, num| sum + num}.to_f / game.size
  end

  all_simulation_returns << avg_returns  
end 

CSV.open("monopoly_returns.csv", "w") do |csv|
  csv << properties
  all_simulation_returns.each do |simulation|
   csv << simulation
  end
end

# Combines property names with returns 
# pp properties.zip(avg_returns)


