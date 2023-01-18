# Description:

# Write a method that takes a field for well-known board game "Battleship" as an argument and returns true if it has a valid disposition of ships, false otherwise. Argument is guaranteed to be 10*10 two-dimension array. Elements in the array are numbers, 0 if the cell is free and 1 if occupied by ship.

# Battleship (also Battleships or Sea Battle) is a guessing game for two players. Each player has a 10x10 grid containing several "ships" and objective is to destroy enemy's forces by targetting individual cells on his field. The ship occupies one or more cells in the grid. Size and number of ships may differ from version to version. In this kata we will use Soviet/Russian version of the game.

# Before the game begins, players set up the board and place the ships accordingly to the following rules:

# There must be single battleship (size of 4 cells), 2 cruisers (size 3), 3 destroyers (size 2) and 4 submarines (size 1). Any additional ships are not allowed, as well as missing ships.
# Each ship must be a straight line, except for submarines, which are just single cell.
# The ship cannot overlap, but can be contact with any other ship.



# Unfinished -- passes all but one test case.  I could "finish" by hardcoding that test case, but I'm looking for a method that would work in general for special cases...
def validate_battlefield(field)
    battleship_count = count_4(field) + count_4(field.transpose)
    cruiser_count = count_3(field) + count_3(field.transpose)
    destroyer_count = count_2(field) + count_2(field.transpose)
    submarine_count = count_1(field)
    # the counts will be higher if ships are next to each other
    return false unless battleship_count >= 1
    return false unless cruiser_count >= 4
    return false unless destroyer_count >= 10
    return false unless submarine_count == 20
    true
  end
  
  def count_1(field)
    count = 0
    (0..9).each do |i|
      (0..9).each {|j| count += 1 if field[i][j] == 1}
    end
    count
  end
  
  def count_2(field)
    count = 0
    field.each do |row|
      (0..8).each do |i|
        count += 1 if row[i] == 1 && row[i+1] == 1
      end
    end
    count
  end
  
  def count_3(field)
    count = 0
    field.each do |row|
      (0..7).each do |i|
        count += 1 if (i..i+2).all? {|j| row[j] == 1}
      end
    end
    count
  end
  
  def count_4(field)
    count = 0
    field.each do |row|
      (0..6).each do |i|
        count += 1 if (i..i+3).all? {|j| row[j] == 1}
      end
    end
    count
  end