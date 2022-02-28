# frozen_string_literal: true

# Defines Event Class. Event is some activity in a room
class Event
  STORES = ['Fridge', 'Mystery Box', 'Hidden Window']
  TYPES = %i[elixir spell poison converter]
  LOCATION = ['right behind You', 'over there', 'up above the corner']

  attr_accessor :type, :storage, :location

  def initialize
    @type = TYPES.sample
    @storage = STORES.sample
    @location = LOCATION.sample
  end

  def info
    UI.event_info(storage, location)
  end

  def perform(player)
    case type
    when :elixir
      player.heal(10)
      UI.found_elixir
    when :spell
      player.power_up(1)
      UI.found_spell(player.power)
    when :poison
      player.hit(10)
      UI.found_poison
    when :converter
      UI.found_converter
      if player.health > 20
        player.hit(20)
        player.power_up(5)
      else
        UI.not_enough_life
      end
    end
  end
end
