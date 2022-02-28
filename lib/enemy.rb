# frozen_string_literal: true

# Defines an Enemy class
class Enemy < Character
  attr_reader :boss

  NAMES = %w[HULK IMP GIANT LAVA HOUND]

  MIN_POWER = 4
  MAX_POWER = 7
  MAX_HEALTH = 25
  MIN_HEALTH = 15
  BOSS_POWER = 8
  BOSS_HEALTH = 40

  def initialize(boss: false)
    @boss = boss
    name = NAMES.sample
    type = 'enemy'

    super(type, name, enemy_health, enemy_power)
  end

  def info
    status
    UI.enemy_info(name) unless boss
    UI.boss_info(name) if boss
  end

  private

  def enemy_health
    boss ? BOSS_HEALTH : rand(MIN_HEALTH..MAX_HEALTH)
  end

  def enemy_power
    boss ? BOSS_POWER : rand(MIN_POWER..MAX_POWER)
  end
end
