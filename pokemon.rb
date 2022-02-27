# require neccesary files
require_relative "pokedex/pokemons"
require_relative "pokedex/moves"

module Pokemethods
  def exp_per_lvl
    case @growth_rate
    when :slow
      ((5 * ((@level + 1)**3)) / 4.0)
    when :medium_slow
      (((6 / 5.0) * ((@level + 1)**3)) - (15 * ((@level + 1)**2)) + (100 * (@level + 1)) - 140)
    when :medium_fast
      (@level + 1)**3
    when :fast
      (4 / 5 * ((@level + 1)**3))
    end
  end

  def add_stat_effort(target)
    type = target.effort_points[:type]
    amount = target.effort_points[:amount]
    @stat_effort[type] += amount
  end

  def base_damage(target)
    move = Pokedex::MOVES[@current_move]
    var = ((2 * @level) / 5.0) + 2
    if move[:type] == :normal
      ((var.floor * @stats[:attack] * move[:power] / target.stats[:defense]).floor / 50.0).floor
    else
      ((var.floor * @stats[:special_attack] * move[:power] / target.stats[:special_defense]).floor / 50.0).floor
    end
  end

  def effectiveness(target)
    move = Pokedex::MOVES[@current_move]
    effectiveness = Pokedex::TYPE_MULTIPLIER.select { |i| i[:user] == move[:type] }
    count = 1
    effectiveness.each do |i|
      if target.type[1].nil?
        count = i[:multiplier] if target.type[0] == i[:target]
      elsif target.type[0] == i[:target] || target.type[1] == i[:target]
        count *= i[:multiplier]
      end
    end
    effec_mssg(count, target)
    count
  end

  def effec_mssg(count, target)
    return puts "It doesn't affect #{target.name}!" if count.zero?
    return puts "It's super effective!" if count >= 1.5
    return puts "It doesn't affect #{target.name}!" if count <= 0.5
  end

  def stats_ind
    h = { hp: 0, attack: 0, defense: 0, special_attack: 0, special_defense: 0, speed: 0 }
    h.each { |k, _v| h[k] = rand(1..31) }
  end
end

class Pokemon
  include Pokemethods
  attr_reader :type, :name, :current_move, :stats, :moves, :specie, :effort_points, :base_exp, :health, :base_stats
  attr_accessor :level, :exp

  def initialize(poke_specie, poke_name, poke_lvl = 1)
    poke_details = Pokedex::POKEMONS[poke_specie]
    @specie = poke_details[:species]
    @type = poke_details[:type]
    @base_exp = poke_details[:base_exp]
    @growth_rate = poke_details[:growth_rate]
    @base_stats = poke_details[:base_stats]
    @effort_points = poke_details[:effort_points]
    @moves = poke_details[:moves]
    @name = poke_name.empty? ? poke_specie : poke_name
    @ind_stats = stats_ind
    @current_move = nil
    @effort_value = { hp: 0, attack: 0, defense: 0, special_attack: 0, special_defense: 0, speed: 0 }
    @level = poke_lvl
    @exp = @level == 1 ? 0 : exp_per_lvl
    @stat_effort = { hp: 0, attack: 0, defense: 0, special_attack: 0, special_defense: 0, speed: 0 }
    @stats = init_stats
  end

  def prepare_for_battle
    @health = @stats[:hp]
    @current_move = nil
  end

  def receive_damage(damage)
    @health -= damage
  end

  def set_current_move(move)
    @current_move = move
  end

  def fainted?
    !@health.positive?
  end

  def attack(target)
    puts "#{@name} used #{current_move}!"

    hits = Pokedex::MOVES[current_move][:accuracy] >= rand(1..100)
    if hits
      dmg = base_damage(target).to_i
      if rand(1..16) == 5
        dmg *= 1.5
        puts "It was a CRITICAL hit!"
      end
      dmg = (dmg * effectiveness(target)).floor
      target.receive_damage(dmg)
      puts "And it hit #{target.name} with #{dmg} damage"
      puts "-" * 20
      return
    end
    puts "But it missed"
    puts "-" * 20
  end

  def gain_exp(target)
    (target.base_exp * target.level / 7.0).floor
  end

  def increase_stats(target)
    add_stat_effort(target)
    @exp = gain_exp(target)
    puts "#{@name} gained #{gain_exp(target)} experience points"
    return unless @exp >= exp_per_lvl.floor

    @level += 1
    puts "#{@name} reached level #{@level}!"
    @stats = init_stats
  end

  def init_stats
    h = { hp: 1, attack: 1, defense: 1, special_attack: 1, special_defense: 1, speed: 1 }
    h.each do |k|
      value = ((2 * @base_stats[k[0]]) + @ind_stats[k[0]] + @stat_effort[k[0]])
      if k == :hp
        h[k[0]] = ((value * @level / 100) + @level + 10).floor
        next
      end
      h[k[0]] = (((value * @level) / 100) + 5).floor
    end
  end
end
