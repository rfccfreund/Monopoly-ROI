require './engine'
require 'pp'
require 'csv'
require 'rover-df'

# Pregame setup
properties = ["Med", "Baltic", "RR", "Ori Ave", "Vermont", "Connecticut", "Charles Place", "EE", "States Ave", "Virginia", "Penn Rail", "St. James",
"Tenn Ave", "NY Ave", "Ken Ave", "Indiana", "Illinois", "B&O Rail", "Atlantic Ave", "Ventnor Ave", "WW", "Marvin Gardins", "Pacific Ave", "NC Ave", "Penn Ave",
"Short Line", "Park Place", "Boardwalk"]
all_simulation_returns = []

# Runs monopoly simulation x number of times
# naive policy is purchase everything 
100.times do
  avg_returns = []
  all_returns = run_simulation(50)

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


