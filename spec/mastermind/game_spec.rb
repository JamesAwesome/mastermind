require File.join(File.dirname(__FILE__), "/../spec_helper")

module Mastermind
  # Begin the description of the class we will be testing.
  describe Game do
    # The context which we are testing.
    context "starting up" do
      # Tasks which should be perfomed before running each example
      before(:each) do
        # Create a mock object so we can check the output from our game
        @messenger = double("messenger").as_null_object
        # Create a new game using our new messenger
        @game = Game.new(@messenger)
      end

      # It is important to have only one expectation per description.
      # This will give us more visibility into exactly WHAT is broken in our
      # application when our examples fail.

      # Our first expectation.
      it "should send a welcome message" do
        # Set our expectation
        @messenger.should_receive(:puts).with("Welcome to Mastermind!")
        # Start the game
        @game.start
      end

      # Our second expectation.
      it "should prompt for the first guess" do
        # Set our expectation
        @messenger.should_recieve(:puts).with("Enter guess:")
        # Start the game
        @game.start
      end
    end
  end
end
