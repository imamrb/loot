# frozen_string_literal: true

# Handles player actions with enemy
class PlayerAction
  attr_reader :action, :room, :player, :enemy

  def initialize(action, room, player, enemy)
    @action = action
    @room = room
    @player = player
    @enemy = enemy
  end

  def self.call(action, room, player)
    new(action, room, player, room.enemy).call
  end

  def call
    raise InvalidAction, UI.not_in_a_enemy_room unless room.enemy

    case action
    when :fight
      fight(room.enemy, player)
    when :run
      run(room.enemy, player)
    end

    room.mark_complete
  end

  private

  def fight(enemy, player)
    while player.alive?
      enemy_power = enemy.hit_power
      player_power = player.hit_power

      UI.player_hit_enemy(player_power, enemy.health)
      enemy.hit(player_power)

      unless enemy.alive?
        UI.enemy_defeated
        return
      end

      player.hit(enemy_power)
      UI.enemy_hit_player(enemy_power, player.health)
    end
  end

  def run(enemy, player)
    possibility = 10 - enemy.power

    if possibility > 5
      UI.escaped
    elsif possibility > 3
      player.hit(10)
      UI.escaped_with_hit(10)
    else
      UI.enemy_killed_you
    end
  end
end
