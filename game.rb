# require neccesary files

class Game
  def start
    # Create a welcome method(s) to get the name, pokemon and pokemon_name from the user
    
    # Then create a Player with that information and store it in @player
    
    # Suggested game flow
    action = menu
    until action == "Exit"
      case action
      when "Train"
        train
        action = menu
      when "Leader"
        challenge_leader
        action = menu
      when "Stats"
        show_stats
        action = menu
      end
    end

    goodbye
  end

  def train
    # Complete this
    bot = Bot.new(player.pokemon.level)
    battle = Battle.new(player, bot)
    battle.start
  end

  def challenge_leader
    # Complete this
    bot = Bot.new(10, "Gym Leader Brock")
    battle = Battle.new(player, bot)
    battle.start
  end

  def show_stats
    # Complete this
    puts "#{player.pokemon.name}:"
    puts "Kind: #{player.pokemon.species}"
    puts "Level: #{player.pokemon.level}"
    puts "Type: #{player.pokemon.type}"
    stats(player)
  end

  def goodbye
    # Complete this
    puts "Thanks for playing Pokemon Ruby"
    puts "This game was created with love by: Julio, Eduardo y Manuel"
  end

  def menu
    # Complete this
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
end

game = Game.new
game.start
