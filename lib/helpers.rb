module Helpers
	def Helpers.codeSize
		4
	end
	def Helpers.rounds
		5
	end
	def Helpers.pegs
		["red", "blue", "green", "yellow", "magenta", "cyan"]
	end
	
	def Helpers.printFeedback(correct, onlyClrCorrect)
		puts "Exactly correct: #{correct}"
		puts "Correct color but wrong space: #{onlyClrCorrect}"
	end
end