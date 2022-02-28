# Defines methods containing helper texts and IO related methods
class UI
  ## TODO: Move text only messages to an array
  ## TODO: Dynamically define methods from an array of hashes
  class << self
    def welcome(name)
      puts "Welcome Captain: #{name} to the world of Loot!"
      puts 'You are about to start an exciting journey. Roam around to explore this awesome world.'
      puts 'But be careful about enemies. You must explore the whole world to complete the journey.'
      puts 'Good Luck!'
    end

    def get_cmd
      print "\nType `help` for possible commands.\n\n"
      print 'Your command? : '
      gets.chomp.downcase
    end

    def ask(question)
      print question

      gets.chomp
    end

    def help(room)
      puts '.' * 50
      print "\nBasic Commands:\n\n"
      puts 'map      : See the current map'
      puts 'wmi      : Find out where you are!'
      puts 'status   : Your currnet player info'
      puts 'location : Your current location on map'
      puts 'exit     : Quit game'

      print "\nPermitted commands based on player state:\n\n"
      if room.enemy
        puts 'fight : Fight enemy'
        puts 'run   : Run From the enemy'
      elsif room.event
        puts 'yes :  Perform event action'
        puts 'no  :  Ignore event'
      else
        puts 'up   : Move one room up'
        puts 'down : Move one room down'
        puts 'left : Move one room left'
        puts 'right: Move one room right'
      end
      puts '.' * 50
    end

    def new_line(times = 1)
      times.times do
        print "\n"
      end
    end

    def exit
      puts 'Mission aborted! Good Bye!'
      new_line
    end

    ## Game Texts

    def invalid_action
      puts 'Action Invalid!'
    end

    def navigation_help
      puts "\nMove on to a new room using navigation commands. (up/down/left/right) \n"
    end

    def clear_this_room_first
      puts 'Clear the current room before moving into a new one!'
    end

    ## Room Texts

    def room_location_info(lat, long)
      puts "You are now in room: #{lat}, #{long}\n"
    end

    def empty_room_info
      puts 'This room was already visited before! No new activity here.'
    end

    ## Enemy Texts

    def enemy_info(name)
      puts "You are facing enemy #{name}! What do you do? (fight/run)"
    end

    def boss_info(name)
      puts "You are now facing the Enemy King: #{name}! What do you do? (fight/run) \n"
    end

    ## Event Texts

    def event_info(storage, location)
      puts "You are in a event room! Theres a #{storage}, #{location}.\n" \
           'Would you like to open it? (yes/no)'
    end

    def found_elixir
      puts 'You have found Elixir! Healing you for 10 HP.'
    end

    def found_spell(power)
      puts "You have found a powerful spell! Your new power: #{power}."
    end

    def found_poison
      puts 'You have got infected with poison! Lost 10 HP.'
    end

    def found_converter
      puts "You find \"the converter\", a ancestral item who convert HP to POWER, you'r convert 20 HP to 5 POWER."
    end

    ## Player Texts

    def not_enough_life
      puts 'Not enough life'
    end

    def player_lost
      puts 'Player is dead. Game Over!'
      final_message('Mission Failed!')
    end

    def player_won
      print "\nYAY!! You have conqured the world of loot!\n"
      final_message('Mission Passed!')
    end

    def final_message(message)
      puts '#' * 30
      puts message
      puts '#' * 30
    end

    ## World Texts

    def map_info
      puts ' X indicates room is not visited yet'
      puts ' O indicates room is visited'
    end

    def area_out_of_bounds
      puts "Sorry, can't step into the outside world. You are on the edge of the map.\n"
      puts 'Try other directions. Type `map`` to see your current location'
    end

    ## Player Action Texts

    def not_in_a_enemy_room
      "You are not in a enemy room! \n"
    end

    def not_in_a_event_room
      "You are not in a event room! \n"
    end

    def escaped
      puts 'You have escaped the enemy!'
    end

    def player_hit_enemy(hit_power, enemy_health)
      puts "You hit the enemy with #{hit_power} PO! Enemy Health: #{enemy_health} HP"
    end

    def enemy_hit_player(hit_power, player_health)
      puts "The enemy hit you back with #{hit_power} PO -> you loose #{hit_power} HP!"
      puts "Player Health: #{player_health} HP"
    end

    def enemy_defeated
      puts 'Congrats! The enemy is defeated! :)'
    end

    def escaped_with_hit(hp)
      puts "\nEscaped with hit. Lost #{hp} HP"
    end

    def enemy_killed_you
      puts 'Enemy Killd you!'
    end
  end
end
