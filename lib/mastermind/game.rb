module Mastermind
  class Game
    # Initialize our Game class with a messenger object. This handles IO
    def initialize(messenger)
      @messenger = messenger
    end

    # Start the mastermind game.
    def start
      @messenger.puts "Welcome to Mastermind!"
      @messenger.puts "Enter guess:"
    end
  end
end
