class WordsGenerator 
	def initialize()
		dictionaryFile = File.new("./google-10000-english-no-swears.txt", 'r')
		dictionary = dictionaryFile.readlines().select{
			|word|
			word.strip.length >= 5 && word.strip.length <= 12
		}
		dictionaryFile.close()
		@dictionary=dictionary 
	end
	def generateWord()
		randomIndex = (rand()*@dictionary.length).floor
		@dictionary[randomIndex].strip
	end
end
