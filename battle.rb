require_relative "pokedex/moves"
require_relative "player"

class Battle
  attr_reader :player_poke

  def initialize(player, bot)
    @player = player
    @bot = bot
    @player_poke = player.pokemon
    @bot_poke = bot.pokemon
  end

  def start
    puts "#{@player.name} challenge #{@bot.name} for training"
    puts "#{@bot.name} has a #{@bot_poke.name} level #{@bot_poke.level}"
    action = menu_battle
    return if action.include?("eave")

    init_battle
    @player_poke.prepare_for_battle
    @bot_poke.prepare_for_battle
    until @bot_poke.fainted? || @player_poke.fainted?
      status_battle
      @player.select_move
      @bot.select_move
      first = select_first(@player_poke, @bot_poke)
      second = first == @player_poke ? @bot_poke : @player_poke
      first.attack(second)
      second.attack(first) unless second.fainted?

    end
    end_battle(@player_poke, @bot_poke)
  end

  def select_first(player_poke, bot_poke)
    moves = Pokedex::MOVES
    playermove = player_poke.current_move
    botmove = bot_poke.current_move
    return player_poke if moves[playermove][:priority] > moves[botmove][:priority]
    return bot_poke if moves[playermove][:priority] < moves[botmove][:priority]
    return player_poke if player_poke.base_stats[:speed] > bot_poke.base_stats[:speed]
    return bot_poke if player_poke.base_stats[:speed] < bot_poke.base_stats[:speed]

    [player_poke, bot_poke].sample
  end

  def init_battle
    puts ""
    puts "#{@bot.name} sent out #{@bot_poke.name}!"
    puts "#{@player.name} sent out #{@player_poke.name}!"
    puts "-------------------Battle Start!-------------------"
  end

  def status_battle
    puts ""
    puts "#{@player.name}'s #{@player_poke.name} - level #{@player_poke.level}"
    puts "HP: #{@player_poke.health}"
    puts "#{@bot.name}'s #{@bot_poke.name} - level #{@bot_poke.level}"
    puts "HP: #{@bot_poke.health}"
    puts ""
  end

  def menu_battle
    puts "What do you want to do now?"
    puts "1. Fight          2. Leave"
    print ">"
    gets.chomp
  end

  def end_battle(player_poke, bot_poke)
    puts "-" * 20
    winner = player_poke.fainted? ? bot_poke : player_poke
    loser = winner == player_poke ? bot_poke : player_poke
    puts "#{loser.name} FAINTED!"
    puts "-" * 20
    puts "#{winner.name} WINS!"
    winner.increase_stats(loser) if winner == player_poke
    puts "-------------------Battle Ended!-------------------"
  end
end

# ash = Player.new("Ash", "Charmander")
# bot = Bot.new(ash.pokemon.level)
# bat = Battle.new(ash, bot)
# bat.start
# p ash.pokemon.stats
