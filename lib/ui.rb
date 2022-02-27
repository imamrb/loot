class UI
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
      puts question

      gets.chomp
    end

    def invalid_action
      puts 'Action Invalid!'
    end

    def not_in_a_enemy_room
      "You are not in a enemy room! \n"
    end

    def not_in_a_event_room
      "You are not in a event room! \n"
    end

    def escaped
      puts 'You have escaped the enemy!'
    end

    def escaped_with_hit
      puts 'Escaped with hit'
    end

    def enemy_killed_you
      puts 'Enemy Killd you!'
    end

    def clear_this_room_first
      puts 'Clear this current room to move into a new one!'
    end

    def help(room)
      puts '*' * 50
      puts 'map: See the current map'
      puts 'wmi: Find out where you are!'
      puts 'status: Your currnet player info'
      if room.enemy
        puts 'fight: Fight enemy'
        puts 'run: Run From the enemy'
      elsif room.event
        puts 'yes: Perform event action'
        puts 'no: Ignore event'
      else
        puts 'up: Move one room up'
        puts 'down: Move one room down'
        puts 'left: Move one room left'
        puts 'right: Move one room right'
      end
      puts '*' * 50
    end

    def new_line(times = 1)
      times.times do
        print "\n"
      end
    end

    def exit
      puts 'Good Bye!'
    end
  end
end
