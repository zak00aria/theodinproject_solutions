require './lib/game'
exit = false
game = Game.new()
while !exit
	game.start()
	d = ''
	while d!='y' and d!='n'
		print "Play again (y/n)? "
		d = gets().to_s.strip.downcase
		if d=='n'
			exit = true
		end
	end
end
