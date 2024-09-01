require_relative "./player.rb"
require_relative "./helpers.rb"

class User < Player
	def initialize()
		super("Player")
	end
	def generateCode()
	end
	def giveFeedback(guess)
		correct = 0
		onlyClrCorrect = 0
		puts "give a feedback:"
		print "correct :"
		correct = gets.to_i
		print "correct color but wrong space :"
		onlyClrCorrect = gets.to_i
		return {
			:correct => correct,
			:onlyClrCorrect => onlyClrCorrect
		}
	end
	def makeAGuess(feedback)
		guess=[]
		#if feedback
		#	Helpers.printFeedback(feedback[:correct], feedback[:onlyClrCorrect])
		#end
		puts "guess the code:"
		for i in 1..Helpers.codeSize do
			print "peg #{i} color: "
			color = gets.strip()
			guess.push(color)
		end
		guess
	end
end