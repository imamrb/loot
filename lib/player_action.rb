class PlayerAction
  def self.call(action, room, player)
    raise InvalidAction, UI.not_in_a_enemy_room unless room.enemy

    case action
    when 'fight', 'f'
      fight(room.enemy, player)
    when 'run', 'r'
      run(room.enemy, player)
    end

    room.mark_complete
  end

  def self.fight(enemy, player)
    while player.alive?
      enemy_hp = enemy.hit_power
      player_hp = player.hit_power

      puts "You hit the enemy with #{player_hp} HP !"
      enemy.hit(player_hp)

      unless enemy.alive?
        puts 'The enemy is defeated! :)'
        return
      end

      player.hit(enemy_hp)
      puts "The enemy hit you back with #{enemy_hp} -> you loose #{enemy_hp} HP !"
    end
  end

  def self.run(enemy, player)
    possibility = 100 - enemy.hit_power

    if possibility > 50
      UI.escaped
    elsif possibility > 30
      player.hit(10)
      UI.escaped_with_hit(10)
    else
      UI.enemy_killed_you
    end
  end
end
