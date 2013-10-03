# Create a @messenger if one does not exist
def messenger
  @messenger ||= StringIO.new
end

# Create a new @game object with our messenger if one does not exist.
def game
  @game ||= Mastermind::Game.new(messenger)
end

# Shortcut to let us more easily check game output in our step definitions
def messages_should_include(message)
  messenger.string.split("\n").should include(message)
end

Given( /^I am not yet playing$/ ) do
end

# How to set the secret code
Given( /^the secret code is (. . . .)$/ ) do |code|
  game.start(code.split)
end

# What to do when a guess is made
When( /^I guess (. . . .)$/ ) do |code|
  game.guess(code.split)
end

# What to do when the game is started
When( /^I start a new game$/ ) do
  game.start(%w[r g y c])
end

# Test that the game says the right thing
Then( /^the game should say "(.*)"$/ ) do |message|
  messages_should_include(message)
end

# Test that the mark comes back correct
Then( /^the mark should be (.*)$/ ) do |mark|
  messages_should_include(mark)
end
