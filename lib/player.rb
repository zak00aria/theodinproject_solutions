class Player
	attr_accessor :name
	def initialize(name)
		@name=name
	end
	def generateCode()
		"code 🧀"
	end
	def giveFeedback(guess)
		puts "feedback 😁"
	end
	def makeAGuess(feedback)
		puts "guess 😅"
	end
end
