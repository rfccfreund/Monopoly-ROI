# Custom error classes for the Monopoly simulation
module MonopolyErrors
  class InsufficientFundsError < StandardError; end
  class InvalidMoveError < StandardError; end
  class GameStateError < StandardError; end
  class ConfigurationError < StandardError; end
end 