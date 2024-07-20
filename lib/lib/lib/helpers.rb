def check_if_player_wins(player, cell, board, inRow)
  x = cell.column
  y = cell.row
  startY=[y-inRow-1, 0].max
  endY=[y+inRow-1, board.rows-1].min
  startX=[x-inRow-1, 0].max
  endX=[x+inRow-1, board.columns-1].min
  counterY=0
  counterX=0
  counterXY=0
  counterXY_r=0
  for i in 0..endX-startX do
    if(board.cells[(startY+i)*board.rows+x].value==player)
      counterY=counterY+1
      if counterY==inRow
        return player
      end
    else
      counterY=0
    end
    if(board.cells[y*board.rows+(startX+i)].value==player)
      counterX=counterX+1
      if counterX==inRow
        return player
      end
    else
      counterX=0
    end
    if(board.cells[(startY+i)*board.rows+(startX+i)].value==player)
      counterXY=counterXY+1
      if counterXY==inRow
        return player
      end
    else
      counterXY=0
    end
    if(board.cells[(endY-i)*board.rows+(startX+i)].value==player)
      counterXY_r=counterXY_r+1
      if counterXY_r==inRow
        return player
      end
    else
      counterXY_r=0
    end
  end
  return nil
end
