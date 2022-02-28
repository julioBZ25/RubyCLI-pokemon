require_relative "pokedex/pokemons"
require_relative "player"
require_relative "battle"

module AUXMETHODS
  def wel_pokemon
    puts "#" * 60
    puts "#{'#' * 14}#{' ' * 32}#{'#' * 14}"
    puts "#{'#' * 11}#{' ' * 2}#{'-' * 3}#{' ' * 8}Pokemon Ruby#{' ' * 8}#{'-' * 3}#{' ' * 2}#{'#' * 11}"
    puts "#{'#' * 14}#{' ' * 32}#{'#' * 14}"
    puts "#" * 60
    puts ""
    puts "Hello there! Welcome to the world of POKEMON! My name is OAK!\nPeople call me the POKEMON PROF! "
    puts ""
    puts "This world is inhabited by creatures called POKEMON!"
    puts "For some people, POKEMON are pets. Others use them for fights."
    puts "Myself...I study POKEMON as a profession."
  end

  def wel_player
    name_inputs = inputs
    puts ""
    puts "Right! So your name is GREAT #{name_inputs}!"
    puts "Your very own POKEMON legend is about to unfold! A world of"
    puts "dreams and adventures with POKEMON awaits! Let's go!"
    puts "Here, GREAT MASTER! There are 3 POKEMON here! Haha!"
    puts "When I was young, I was a serious POKEMON trainer."
    puts "In my old age, I have only 3 left, but you can have one! Choose!"
    puts ""
    name_inputs
  end

  def wel_boss(name_inputs, name_pokemon)
    puts "GREAT #{name_inputs}, raise your young GREAT #{name_pokemon} by making it fight!"
    puts "When you feel ready you can challenge BROCK, the PEWTER's GYM LEADER"
    puts ""
  end

  def goodbye
    # Complete this
    puts "Thanks for playing Pokemon Ruby"
    puts "This game was created with love by: Julio y Eduardo"
  end
end

class Game
  include AUXMETHODS

  def start
    wel_pokemon
    name_inputs = wel_player
    pokemon_species = selecciona_pokemon
    name_pokemon = inputs_pokemon
    player = Player.new(name_inputs, pokemon_species, name_pokemon)
    wel_boss(player.name, player.pokemon.name)
    action = menu
    until action == "Exit"
      case action
      when "Train"
        train(player)
        action = menu
      when "Leader"
        challenge_leader(player)
        action = menu
      when "Stats"
        show_stats(player)
        action = menu
      end
    end
    goodbye
  end

  def train(player)
    # Complete this
    bot = Bot.new(player.pokemon.level)
    battle = Battle.new(player, bot)
    battle.start
  end

  def challenge_leader(player)
    # Complete this
    bot = Bot.new(10, "Gym Leader Brock", "Onix")
    battle = Battle.new(player, bot)
    battle.start
  end

  def show_stats(player)
    # Complete this
    puts "#{player.pokemon.name}:"
    puts "Kind: #{player.pokemon.specie}"
    puts "Level: #{player.pokemon.level}"
    puts "Type: #{player.pokemon.type}"
    stats(player)
  end

  def menu
    menu = ["Stats", "Train", "Leader", "Exit"]
    puts "#{'-' * 23} Menu #{'-' * 23}"
    almacena_menu = menu.each.with_index { |a, index| print "#{index + 1}. #{a}        " }
    almacena = ""
    puts ""
    until almacena_menu.include?(almacena)
      print ">"
      almacena = gets.chomp
      puts ""
    end
    almacena
  end

  def stats(player)
    puts "Stats:"
    puts "HP: #{player.pokemon.stats[:hp]}"
    puts "Attack: #{player.pokemon.stats[:attack]}"
    puts "Defense: #{player.pokemon.stats[:defense]}"
    puts "Special Attack: #{player.pokemon.stats[:special_attack]}"
    puts "Special Defense: #{player.pokemon.stats[:special_defense]}"
    puts "Speed: #{player.pokemon.stats[:speed]}"
    puts "Experience Points: #{player.pokemon.exp}"
  end

  def inputs
    name = ""
    while name.empty?
      puts "First, what is your name?"
      print ">"
      name = gets.chomp.upcase
    end
    name
  end

  def select_pokemon(options)
    options.each.with_index { |option, index| print "#{index + 1}. #{option}   " }
    puts ""
  end

  def selecciona_pokemon
    poke01 = Pokedex::POKEMONS.select { |_name, data| data[:species] == "Bulbasaur" }
    poke02 = Pokedex::POKEMONS.select { |_name, data| data[:species] == "Charmander" }
    poke03 = Pokedex::POKEMONS.select { |_name, data| data[:species] == "Squirtle" }
    almacena_pokemon_total = poke01.keys + poke02.keys + poke03.keys

    select = ""
    until almacena_pokemon_total.include?(select)
      select_pokemon(almacena_pokemon_total)
      print ">"
      select = gets.chomp
      puts ""
    end
    puts "You seleted #{select}. Great choice"
    select
  end

  def inputs_pokemon
    puts "Give your pokemon a name"
    print ">"
    gets.chomp.upcase
  end
end

game = Game.new
game.start
