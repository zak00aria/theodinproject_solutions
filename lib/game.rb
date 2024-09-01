require_relative "./helpers.rb"
class Game
	attr_reader :secretCreator, :guesser
	def initialize(secretCreator, guesser)
		@secretCreator = secretCreator
		@guesser = guesser
	end
	def start()
		@secretCreator.generateCode()
		guess = nil
		feedback= nil
		winner = @secretCreator.name
		puts "possible colors: \n\t#{Helpers.pegs.to_s[1..-2]}"
		for r in 1..Helpers.rounds do
			puts "\n--#{r}-------------------------------\n\n"
			guess = @guesser.makeAGuess(feedback)
			puts ""
			feedback = @secretCreator.giveFeedback(guess)
			if feedback[:correct]==Helpers.codeSize
				winner = @guesser.name
				break
			end
		end
		puts "\n------------------------"
		puts "#{winner} wins!"
	end
end