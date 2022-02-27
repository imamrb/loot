# frozen_string_literal: true

# Parent class for Player and Enemy
class Character
  attr_accessor :name, :health, :power, :type

  def initialize(type, name, health, power)
    @type = type.upcase
    @name = name
    @health = health
    @power = power
  end

  def alive?
    health.positive?
  end

  def dead?
    !health.positive?
  end

  def hit(hp)
    self.health -= hp
  end

  def hit_power
    (1..power).to_a.sample
  end

  def status
    UI.new_line
    puts decorator * 20 + " #{type} INFO " + decorator * 18
    puts "--- NAME    : #{name} ---"
    puts "--- POWER   : #{power} PO ---"
    puts "--- HEALTH  : #{health} HP ---"
    puts decorator * 50
    UI.new_line
  end

  private

  def decorator
    type == 'ENEMY' ? '!' : '^'
  end
end
