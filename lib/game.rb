require './lib/words-generator'
class Game 
	def initialize()
		@wordsGenerator = WordsGenerator.new()
	end
	def start()
		@word = @wordsGenerator.generateWord()
		@guessedLetters = []
		@tries = 7
		@userWin = false
		@word.split('').each{
			|letter|
			print "#{@guessedLetters.find_index(letter) != nil ? letter : '_'} "
		}
		while @tries > 0 and !@userWin
			self.getUserGuess()
			@tries -= 1
		end
		if @userWin
			puts "\n\nYou win!\n\n"
		else
			puts "\n\nGame Over!\n\n"
		end
	end
	def getUserGuess()
		print "\n\nGuess a lettr ("
		print @tries>=2 ? "#{@tries} guesses left" : "last guess!"
		print ") : \n"
		@guess = gets().to_s.strip
		self.checkIfGuessCorrect()
		correctGuesses = 0
		@word.split('').each{
			|letter|
			alreadyGuessed = @guessedLetters.find_index(letter) != nil
			if alreadyGuessed
				correctGuesses += 1
			end
			print "#{(@userWin or alreadyGuessed) ? letter : '_'} "
		}
		if correctGuesses == @word.length
			@userWin = true
		end
	end
	def checkIfGuessCorrect()
		if @guess.length == 1
			if @word.index(@guess) != nil
				@guessedLetters.push(@guess)
			end
		elsif @guess == @word
			@userWin = true
		end
	end
end
