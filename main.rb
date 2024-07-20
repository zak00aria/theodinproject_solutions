require './lib/grid'
require './lib/helpers'

BOARD_SIZE = 3
IN_ROW = 3
board = Grid.new(BOARD_SIZE, BOARD_SIZE)
winner = nil
for i in 0..BOARD_SIZE * BOARD_SIZE - 1 do
  player = i.even? ? 'X' : 'O'
  board.draw()
  print " #{player} turn:"
  loop do
    next_position = gets.to_i
    cell = board.cells[next_position]
    if next_position >= 0 and cell and cell.value != 'X' and cell.value != 'O'
      cell.value = player
      winner = check_if_player_wins(player, cell, board, IN_ROW)?player:nil
      break
    end
  end
  if winner
    board.draw()
    break
  end
end
if winner
  puts "#{winner} Wins!"
else
  puts "Draw!"
end
puts ""
