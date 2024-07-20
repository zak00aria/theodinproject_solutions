require './lib/cell'

class Grid
	attr_accessor :size, :rows, :columns, :cells
	def initialize(rows, columns)
		@size = rows * columns
		@rows = rows
		@columns = columns
		@cells = Array.new(size)
		@cells.each_with_index{|cell, i| 
			x=i%@rows
			y=(i/@rows).floor()
			@cells[i]=Cell.new(i, x, y)
		}
	end
	def draw()
		for i in 0..@rows-1 do
			for j in 0..@columns-1 do
			print '+--------'
			end
			print "+\n"
			for j in 0..@columns-1 do
			print '|        '
			end
			print "|\n"
			for j in 0..@columns-1 do
				cell=@cells[i*@columns+j]
			if cell.value.to_s().length==1
			print "|   #{cell.value}    "
			else
			print "|   #{cell.value}   "
			end
			end
			print "|\n"
			for j in 0..@columns-1 do
			print '|        '
			end
			print "|\n"
		end
		for j in 0..@columns-1 do
			print '+--------'
		end
		print "+\n"
	end
end
