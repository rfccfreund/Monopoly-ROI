require './engine'
require 'pp'

# Game loop:
# player rolls dice
# players position is updated and corresponding tile is looked at
# naive policy is purchase everything
# player purchases or pays
# other players take turns
# next round 


properties = ["Med", "Baltic", "RR", "Ori Ave", "Vermont", "Connecticut", "Charles Place", "EE", "States Ave", "Virginia", "Penn Rail", "St. James",
"Tenn Ave", "NY Ave", "Ken Ave", "Indiana", "Illinois", "B&O Rail", "Atlantic Ave", "Ventnor Ave", "WW", "Marvin Gardins", "Pacific Ave", "NC Ave", "Penn Ave",
"Short Line", "Park Place", "Boardwalk"]
avg_returns = []

all_returns = run_simulation()

all_returns = all_returns.transpose
all_returns.each do 
  |game|
  avg_returns << game.inject{ |sum, num| sum + num}.to_f / game.size
end

pp properties.zip(avg_returns)


