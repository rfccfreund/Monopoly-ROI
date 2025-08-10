require 'csv'
require './config'

# Statistical analysis tools for Monopoly simulation results
class StatTools
  def initialize(csv_file = Config::OUTPUT_FILE)
    @data = load_data(csv_file)
  end

  def load_data(csv_file)
    CSV.read(csv_file, headers: true).map(&:to_h)
  end

  def property_rankings
    averages = calculate_averages
    sorted_properties = averages.sort_by { |property, avg| -avg }
    
    puts "\n=== Property ROI Rankings ==="
    sorted_properties.each_with_index do |(property, avg), index|
      puts "#{index + 1}. #{property}: #{avg.round(4)}"
    end
    
    sorted_properties
  end

  def calculate_averages
    averages = {}
    Config::PROPERTIES.each do |property|
      values = @data[property].map(&:to_f)
      averages[property] = values.sum / values.length
    end
    averages
  end

  def top_properties(count = 5)
    averages = calculate_averages
    averages.sort_by { |property, avg| -avg }.first(count)
  end

  def bottom_properties(count = 5)
    averages = calculate_averages
    averages.sort_by { |property, avg| avg }.first(count)
  end

  def property_variance
    variances = {}
    Config::PROPERTIES.each do |property|
      values = @data[property].map(&:to_f)
      mean = values.sum / values.length
      variance = values.map { |v| (v - mean) ** 2 }.sum / values.length
      variances[property] = variance
    end
    variances
  end

  def generate_report
    puts "\n=== Monopoly Simulation Analysis Report ==="
    puts "Total simulations: #{@data.length}"
    puts "Properties analyzed: #{Config::PROPERTIES.length}"
    
    puts "\n--- Top 5 Properties by ROI ---"
    top_properties.each_with_index do |(property, avg), index|
      puts "#{index + 1}. #{property}: #{avg.round(4)}"
    end
    
    puts "\n--- Bottom 5 Properties by ROI ---"
    bottom_properties.each_with_index do |(property, avg), index|
      puts "#{index + 1}. #{property}: #{avg.round(4)}"
    end
    
    puts "\n--- Most Volatile Properties (Highest Variance) ---"
    property_variance.sort_by { |property, variance| -variance }.first(5).each_with_index do |(property, variance), index|
      puts "#{index + 1}. #{property}: #{variance.round(6)}"
    end
  end
end

# Run analysis if called directly
if __FILE__ == $0
  begin
    stats = StatTools.new
    stats.generate_report
  rescue => e
    puts "Error analyzing data: #{e.message}"
  end
end

