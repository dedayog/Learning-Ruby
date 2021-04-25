## Tic-Tac-Toe game for playing with numpad of keyboard
## the computer makes moves randomly

# Forms the array of cells filled with 0
@battle_field = Array.new(5) {Array.new(5) {0}}

# Selects a space symbol
@a_space = ' '

# Selects the first move player
@player = 'X'

# Fills inner cells..
3.times do |i|
  3.times do |j|
    @battle_field[i+1][j+1] = @a_space # ..with space..
  end
end
# ..so, the cells on edge will be used for calculations of win-status

def usr_int # Expect the nums from function. 0 for exit (zero will be taken by case brahch in Main)
  gimme_int = true # Enter input loop
  while gimme_int
    @player == 'X' ? (_ui = gets.chomp.to_i) : (_ui = rand 1..9) # to_i returns 0 for non-nums; rand 1..9 simulates pressing for a computer
    gimme_int = !(0..9).include?(_ui) # exit from loop by pressing the num key
  end
  _ui # returns number
end

def cell_is_empty? (ary)
  ary == @a_space # returns true if the cell is filled with a space
end

def fill_cell(_y, _x) # Fill + check
  @battle_field[_y][_x] = @player # Draws the player's mark in the cell
  case @player # The code below calculates the identification marks in a row and determines the victory
  when 'X'
    return true if (@battle_field[_y][0] += 1) == 3
    return true if (@battle_field[0][_x] += 1) == 3
    if (_y == 2 && _x == 2) || (_y == 1 && _x == 3) || (_y == 3 && _x == 1)
      return true if ((@battle_field[0][4] += 1) == 3)
    end
    if (_y == 2 && _x == 2) || (_y == 3 && _x == 3) || (_y == 1 && _x == 1)
      return true if ((@battle_field[0][0] += 1) == 3)
    end
  when 'O'
    return true if (@battle_field[_y][4] += 1) == 3
    return true if (@battle_field[4][_x] += 1) == 3
    if (_y == 2 && _x == 2) || (_y == 3 && _x == 3) && (_y == 1 && _x == 1)
      return true if ((@battle_field[4][4] += 1) == 3)
    end
    if (_y == 2 && _x == 2) || (_y == 1 && _x == 3) || (_y == 3 && _x == 1)
      return true if ((@battle_field[4][4] += 1) == 3)
    end
  end
  false
end

def chng_player
  @player == 'O' ? @player = 'X' : @player = 'O' # returns another player
end

def btl_fld_print # Displays the battle field, nothing is returned
  # Test: Set _a to 0 and _b to 4, displays entire array with calculated cells
  _a, _b = 1, 3

  _a.upto(_b) do |i|
    _a.upto(_b) do |j|
        print "| #{@battle_field[i][j]} |"
    end
    puts
  end
  puts "-" * 15
  puts
end

#######
# MAIN
#######
btl_fld_print

cont = true # Here main loop starts
while cont
  case usr_int # Matching numbers to cells
  when 1
    x, y = 1, 3
  when 2
    x, y = 2, 3
  when 3
    x, y = 3, 3
  when 4
    x, y = 1, 2
  when 5
    x, y = 2, 2
  when 6
    x, y = 3, 2
  when 7
    x, y = 1, 1
  when 8
    x, y = 2, 1
  when 9
    x, y = 3, 1
  else # 0 for quit game
    exit
  end

  if cell_is_empty?(@battle_field[y][x])
    if fill_cell(y, x)
        puts "Player [#{@player}] win!"
        cont = false
    end
    chng_player
    btl_fld_print
  end
end
