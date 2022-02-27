# require neccesary files
require_relative "pokemon"

class Player
  # (Complete parameters)
  attr_reader :pokemon, :name

  def initialize(player_name, poke_specie, poke_name = "", lvl = 1)
    @name = player_name
    @pokemon = Pokemon.new(poke_specie, poke_name, lvl)
  end

  def select_move
    move = ""
    moves = @pokemon.moves
    until moves.include?(move)
      puts "#{@name}, select your move"
      moves.each_with_index { |element, index| print "#{index + 1}. #{element}  " }
      puts ""
      puts "Select a move to attack:"
      print "> "
      move = gets.chomp # ["scratch", "ember"]
    end
    pokemon.set_current_move(move)
  end
end

# Create a class Bot that inherits from Player and override the select_move method
class Bot < Player
  def initialize(lvl, bot_name = "Random Traineer")
    poke_specie = Pokedex::POKEMONS.keys.sample
    poke_name = ""
    super(bot_name, poke_specie, poke_name, lvl)
  end

  def select_move
    move = Pokedex::POKEMONS[@pokemon.specie][:moves].sample
    pokemon.set_current_move(move)
  end
end
