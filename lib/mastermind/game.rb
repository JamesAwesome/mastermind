module Mastermind
  class Game
    # Initialize our Game class with a messenger object. This handles IO.
    def initialize(messenger)
      @messenger = messenger
    end

    # Begin game and read in the mastermind's "code" for the codebreaker to guess.
    def start(code)
      @code = code
      @messenger.puts "Welcome to Mastermind!"
      @messenger.puts "Enter guess:"
    end

    # When the codebreaker submits a guess, grade it against the mastermind's code.
    def guess(guess)
      result = []
      guess.each_with_index do |peg, index|
        if @code[index] == peg
          result << "b"
        elsif @code.include?(peg)
          result << "w"
        end
      end
      @messenger.puts result.sort.join
    end
  end
end
