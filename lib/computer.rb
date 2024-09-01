require_relative "./player.rb"
require_relative "./helpers.rb"

class Computer < Player
	:code
	:codeMap
	:codePegdCount
	:guessHistory
	:correctGuessMap
	:possibleGuessMap
	:wrongPeg
	def initialize()
		@wrongClr = nil
		@guessHistory = []
		@correctGuessMap = {}
		@possibleGuessMap = {}
		super("Computer")
	end
	def generateCode()
		@code = []
		@codeMap = {}
		@codePegsCount = {}
		for i in 1..Helpers.codeSize do
			sign = rand-0.35<0?-1:1
			randomIndex = sign * (rand*Helpers.pegs.length).floor
			randomPeg = Helpers.pegs[randomIndex]
			@code.push(randomPeg)
			if @codeMap[randomPeg]
				@codeMap[randomPeg].push(i)
				@codePegsCount[randomPeg] = @codePegsCount[randomPeg] + 1
			elsif
				@codeMap[randomPeg] = [i]
				@codePegsCount[randomPeg] = 1
			end
		end
		puts @code.to_s
		return @code
	end
	def giveFeedback(guess)
		puts "feedback :"
		codePegsCountCopy = @codePegsCount.clone
		feedback={
			:correct => 0,
			:onlyClrCorrect => 0
		}
		guess.each_with_index{|clr, i| 
			if @code[i] == clr
			  feedback[:correct] = feedback[:correct] + 1
		      codePegsCountCopy[clr] = codePegsCountCopy[clr] - 1
			end
		}
		guess.each_with_index{|clr, i| 
			if codePegsCountCopy[clr].to_i==0
				next
			end
			codePegsCountCopy[clr] = codePegsCountCopy[clr] - 1
			feedback[:onlyClrCorrect]=feedback[:onlyClrCorrect]+1
		}
		Helpers.printFeedback(feedback[:correct], feedback[:onlyClrCorrect])
		return feedback
	end
	def makeAGuess(feedback)
		puts "computer guess"
		guess = []
		if feedback != nil and @wrongPeg == nil
			if feedback[:correct] == 0 and feedback[:onlyClrCorrect] == 0
				@wrongPeg = @guessHistory[0][0]
			end
		end
		if(feedback == nil or @wrongPeg == nil)
			randomClr = self.pickARandomClr()
			guess = [randomClr, randomClr, randomClr, randomClr]
		else
			if @correctGuessMap[0] and @correctGuessMap[1]
				guess = [@wrongPeg, @wrongPeg, pickARandomClr, pickARandomClr]
			else
				guess = [pickARandomClr, pickARandomClr, @wrongPeg, @wrongPeg]
			end
		end
		puts guess.to_s
		@guessHistory.unshift(guess)
		return guess
	end
	def pickARandomClr()
		sign = rand-0.35<0?-1:1
		randomIndex = sign * (rand*Helpers.pegs.length).floor
		return Helpers.pegs[randomIndex]
	end
end