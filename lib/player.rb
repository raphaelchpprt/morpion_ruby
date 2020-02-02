require 'pry'

class Player
  attr_accessor :name, :symbol
  @@players = Array.new
  @board = Board.new
  @@already_choosen_choices = Array.new

  def initialize
    # check number of players
    if @@players.count < 2
      @name   = gets.chomp
      @symbol = choose_symbol_for_player
      @@players << self
    end
  end

  # Gives 'X' or 'O' to players
  def choose_symbol_for_player
    if @@players.count == 0
      return "X"
    else
      return "O"
    end
  end

  def make_a_choice(symbol, array)
    puts " choisis une case !"
    puts "(Exemple : A1)"
    print "> "
    cell = gets.chomp.to_s

    # Check wrong input of choice
    # While player types wrong input
    while (cell != "A1" && cell != "A2" && cell != "A3" && cell != "B1" && cell != "B2" && cell != "B3" && cell != "C1" && cell != "C2" && cell != "C3") || (@@already_choosen_choices.include? cell)
      # If value is not valid
      if (cell != "A1" && cell != "A2" && cell != "A3" && cell != "B1" && cell != "B2" && cell != "B3" && cell != "C1" && cell != "C2" && cell != "C3")  
        puts "Eh choisis une case valide"
        print "> "
        cell = gets.chomp
      # If value is already chosen
      elsif @@already_choosen_choices.include? cell
        puts "Choisis une case qui n'a pas encore ete prise"
        print "> "
        cell = gets.chomp
      end
    end
    puts "choix : #{cell}"
    array = Board.new.modify_cell(cell, symbol, array)
    @@already_choosen_choices << cell
    return array
  end

end
