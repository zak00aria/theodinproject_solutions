require "./lib/user"
require "./lib/computer"
require "./lib/game"

computer = Computer.new()
user = User.new()
game = Game.new(computer, user)
#game = Game.new(computer, computer)
game.start()
puts "end"