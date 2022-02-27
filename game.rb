require_relative "pokedex/pokemons"
class Game
  def start
    puts "#" * 60
    puts ("#" * 14) + (" " * 32) + ("#" * 14)
    puts ("#" * 11) + (" " * 2) + ("-" * 3) + (" " * 8) + "Pokemon Ruby" + (" " * 8) + ("-" * 3) + (" " * 2) + ("#" * 11)
    puts ("#" * 14) + (" " * 32) + ("#" * 14)
    puts "#" * 60
    puts ""
    p "Hello there! Welcome to the world of POKEMON! My name is OAK!
       People call me the POKEMON PROF! "
    puts ""
    p "This world is inhabited by creatures called POKEMON! For some
      people, POKEMON are pets. Others use them for fights. Myself...
      I study POKEMON as a profession."
    #--------------------- inputs nombre-----
    def inputs
      name = ""
      while name.empty?
        puts "First, what is your name?"
        print ">"
        name = gets.chomp.upcase
      end
      name
    end
    name_inputs = inputs

    puts "Great #{name_inputs}"
    p "Right! So your name is GREAT #{name_inputs}!
    Your very own POKEMON legend is about to unfold! A world of
    dreams and adventures with POKEMON awaits! Let's go!
    Here, GREAT MASTER! There are 3 POKEMON here! Haha!
    When I was young, I was a serious POKEMON trainer.
    In my old age, I have only 3 left, but you can have one! Choose!"
    puts ""
    #--------------------- imprime los pokemones-----
    def select_pokemon(options)
      options.each.with_index do |option, index|
      print "#{index + 1}. #{option}   "
      end
      puts ""
    end
  #--------------------- seleccion de pokemon del archivo pokemon---
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
      end
      select
    end
   #---------------------input nombre pokemon------
    def inputs_pokemon
      name_pokemon = ""
      while name_pokemon.empty?
        puts "Give your pokemon a name"
        print ">"
        name_pokemon = gets.chomp.upcase
      end
      name_pokemon
    end

    #---------barra de menus----------
    def menu
      menu = ["Stats", "Train", "Leader", "Exit"]
      almacena_menu = menu.each.with_index { |a, index| print "#{index + 1}. #{a}        " }

      almacena = ""
      until almacena_menu.include?(almacena)
        print ">"
        almacena = gets.chomp
      end
    almacena
    end
    
    select = selecciona_pokemon
    puts "Your seleted #{select}. Great choice"
    name_pokemon = inputs_pokemon
    puts " GREAT #{name_inputs}, raise your young GREAT #{name_pokemon} by making it fight!
    When you feel ready you can challenge BROCK, the PEWTER's GYM LEADER"
    puts ""
    puts "#{'-' * 23} Menu #{'-' * 23}"
    menu

    # Create a welcome method(s) to get the name, pokemon and pokemon_name from the user

    # Then create a Player with that information and store it in @player

    # Suggested game flow
    # action = menu
    # until action == "Exit"
    #   case action
    #   when "Train"
    #     train
    #     action = menu
    #   when "Leader"
    #     challenge_leader
    #     action = menu
    #   when "Stats"
    #     show_stats
    #     action = menu
    #   end
    # end
  end

  # def train
  #   # Complete this
  # end

  # def challenge_leader
  #   # Complete this
  # end

  # def show_stats
  #   # Complete this
  # end

  # def goodbye
  #   # Complete this
  # end
end

game = Game.new
game.start
