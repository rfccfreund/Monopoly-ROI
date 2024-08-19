require './engine'
require 'pp'
require 'csv'
require 'rover-df'

# Pregame setup
properties = ["Med", "Baltic", "RR", "Ori Ave", "Vermont", "Connecticut", "Charles Place", "EE", "States Ave", "Virginia", "Penn Rail", "St. James",
"Tenn Ave", "NY Ave", "Ken Ave", "Indiana", "Illinois", "B&O Rail", "Atlantic Ave", "Ventnor Ave", "WW", "Marvin Gardins", "Pacific Ave", "NC Ave", "Penn Ave",
"Short Line", "Park Place", "Boardwalk"]
avg_returns = []

# Runs monopoly simulation x number of times
# naive policy is purchase everything 
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

output_string = CSV.generate('', headers: properties, write_headers: true) do |csv|
  csv << avg_returns
end

# Combines property names with returns 
pp output_string
pp properties.zip(avg_returns)


