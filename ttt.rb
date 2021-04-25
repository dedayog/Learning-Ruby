@player = 'X'
@btl_fld = Array.new(5) {Array.new(5) {0}}

3.times do |i|
  3.times do |j|
    @btl_fld[i+1][j+1]=' '
  end
end

def usr_int
  gimme_int = true
  while gimme_int
    @player == 'X' ? (_ui = gets.chomp.to_i) : (_ui = rand 1..9)
    gimme_int = false if (0..9).include?(_ui)
  end
  _ui
end

def cell_is_empty? (ary)
  ary == ' '
end

def fill_cell(_y, _x) # Fill + check
  @btl_fld[_y][_x] = @player
  case @player
  when 'X'
    return true if (@btl_fld[_y][0] += 1) == 3
    return true if (@btl_fld[0][_x] += 1) == 3
    if (_y == 2 && _x == 2) || (_y == 1 && _x == 3) || (_y == 3 && _x == 1)
      return true if ((@btl_fld[0][4] += 1) == 3)
    end
    if (_y == 2 && _x == 2) || (_y == 3 && _x == 3) || (_y == 1 && _x == 1)
      return true if ((@btl_fld[0][0] += 1) == 3)
    end
  when 'O'
    return true if (@btl_fld[_y][4] += 1) == 3
    return true if (@btl_fld[4][_x] += 1) == 3
    if (_y == 2 && _x == 2) || (_y == 3 && _x == 3) && (_y == 1 && _x == 1)
      return true if ((@btl_fld[4][4] += 1) == 3)
    end
    if (_y == 2 && _x == 2) || (_y == 1 && _x == 3) || (_y == 3 && _x == 1)
      return true if ((@btl_fld[4][4] += 1) == 3)
    end
  end
  false
end

def chng_player
  @player == 'O' ? @player = 'X' : @player = 'O'
end

def btl_fld_print
  # Test: Set _a = 0 & _b = 4, it displays whole array with calculation cells
  _a, _b = 1, 3
  
  _a.upto(_b) do |i|
    _a.upto(_b) do |j|
        print "| #{@btl_fld[i][j]} |"
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

cont = true
while cont
  case usr_int
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
  else
    exit
  end

  if cell_is_empty?(@btl_fld[y][x])
    if fill_cell(y, x)
        puts "Player [#{@player}] win!"
        cont = false
    end
    chng_player
    btl_fld_print
  end
end
