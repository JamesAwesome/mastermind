Given( /^I am not yet playing$/ ) do
end

# Test that we can start a new game
When( /^I start a new game$/ ) do
  # Create a new StringIO object in order to catch the output of Mastermind::Game.new
  @messenger = StringIO.new
  # Start a new mastermind game passing in our new StringIO messenger
  game = Mastermind::Game.new(@messenger)
  # Start the game
  game.start
end

# Test that the messages we want to recieve are recieved by our messanger
Then( /^the game should say "(.*)"$/ ) do |message|
  # Make sure the message we capture during in our Then() method matches the message in our feature
  @messenger.string.split("\n").should include(message)
end
