require 'bundler'
Bundler.require
require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/game'
require 'pry'

wanna_play   = true
puts "Player 1, entre ton pseudo :"
print "> "
player1         = Player.new
puts "Player 2, entre ton pseudo :"
print "> "
player2         = Player.new


# Big loop of the game
while wanna_play == true
  # init
  @@already_choosen_choices = Array.new
  @who_is_playing = "str"
  count_rounds = 2
  array        = ["_", "_", "_", "_", "_", "_", "_", "_", "_"]
  board        = Board.new

  puts "Voici la grille :"
  board.display_board(array)

  # Play
  while !Game.new.end_game(array, count_rounds, player1, player2)
    if count_rounds % 2 == 0
      @who_is_playing = player1.name
      print "#{player1.name},"
      player1.make_a_choice('X', array)
    else
      @who_is_playing = player2.name
      print "#{player2.name},"
      player2.make_a_choice('O', array)
    end
    count_rounds += 1
  end

  # Replay ?
  puts "Tu veux rejouer cousin ? (Yes/Non)"
  answer = "lol"
  while answer != 'Yes' && answer != 'Non'
    print "> "
    answer = gets.chomp
    if answer == 'Yes'
      break
    elsif answer == 'Non'
      wanna_play = false
    else
      puts "EH vas-y mets un truc qui marche stp :)"
    end
  end
end