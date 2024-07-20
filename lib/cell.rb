class Cell
	attr_accessor :value, :row, :column
	def initialize(value, column, row)
		@value = value
		@row = row
		@column = column
	end
end
