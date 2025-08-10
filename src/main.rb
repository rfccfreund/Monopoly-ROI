require './engine'
require './config'
require './errors'
require 'pp'
require 'csv'

# Main simulation runner
class MonopolySimulator
  def initialize
    @all_simulation_returns = []
  end

  def run_simulations
    puts "Starting Monopoly simulation..."
    puts "Running #{Config::NUM_SIMULATIONS} simulations with #{Config::NUM_GAMES_PER_SIMULATION} games each"
    
    Config::NUM_SIMULATIONS.times do |sim_num|
      puts "Running simulation #{sim_num + 1}/#{Config::NUM_SIMULATIONS}" if sim_num % 10 == 0
      
      avg_returns = run_single_simulation
      @all_simulation_returns << avg_returns
    end
    
    export_results
    puts "Simulation complete! Results exported to #{Config::OUTPUT_FILE}"
  end

  private

  def run_single_simulation
    all_returns = run_simulation(Config::NUM_GAMES_PER_SIMULATION, false)
    
    # Calculate average returns for each property across all games
    all_returns = all_returns.transpose
    
    all_returns.map do |game_returns|
      game_returns.inject(0.0) { |sum, num| sum + num } / game_returns.size
    end
  end

  def export_results
    CSV.open(Config::OUTPUT_FILE, "w") do |csv|
      csv << Config::PROPERTIES
      @all_simulation_returns.each do |simulation|
        csv << simulation
      end
    end
  end
end

# Run the simulation
if __FILE__ == $0
  begin
    simulator = MonopolySimulator.new
    simulator.run_simulations
  rescue => e
    puts "Error running simulation: #{e.message}"
    puts e.backtrace.first(5)
  end
end


