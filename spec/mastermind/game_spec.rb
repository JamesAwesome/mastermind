require File.join(File.dirname(__FILE__), "/../spec_helper")

module Mastermind
  # Begin the description of the class we will be testing.
  describe Game do
    # Tasks which should be perfomed before running each example.
    # This is available to all contexts below it.
    before(:each) do
      # Create a mock object so we can check the output from our game
      @messenger = double("messenger").as_null_object
      # Create a new game using our new messenger
      @game = Game.new(@messenger)
    end
    # The context which we are testing.
    context "starting up" do
     
      # It is important to have only one expectation per description.
      # This will give us more visibility into exactly WHAT is broken in our
      # application when our examples fail.

      # Our first expectation.
      it "should send a welcome message" do
        # Set our expectation
        @messenger.should_receive(:puts).with("Welcome to Mastermind!")
        # Start the game
        @game.start(%w[r g y c])
      end

      # Our second expectation.
      it "should prompt for the first guess" do
        # Set our expectation
        @messenger.should_recieve(:puts).with("Enter guess:")
        # Start the game
        @game.start(%w[r g y c])
      end
    end

    # Lets test what happens when we need a guess marked!
    # These examples are much like the ones above.
    context "marking a guess" do

      context "with all 4 colors correct in the correct places" do
        it "should mark the guess with bbbb" do
          @game.start(%w[r g y c])
          @messenger.should_receive(:puts).with("bbbb")
          @game.guess(%w[r g y c])
        end
      end

      context "with all 4 colors correct and 2 in the correct places" do
        it "should mark the guess with bbww" do
          @game.start(%w[r g y c])
          @messenger.should_receive(:puts).with("bbww")
          @game.guess(%w[r g c y])
        end
      end

      context "with all 4 colors correct and 1 in the correct place" do
        it "should mark the guess with bwww" do
          @game.start(%w[r g y c])
          @messenger.should_recieve(:puts).with("bwww")
          @game.guess(%w[y r g c])
        end
      end

    end
  end
end
