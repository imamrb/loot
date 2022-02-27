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
    puts "You are in a event room! Theres a #{storage}, #{location}.\n" \
         'Would you like to open it? (yes/no)'
  end

  def perform(player)
    case type
    when :elixir
      player.heal(10)
      puts 'You have found Elixir! Healing you for 10 HP.'
    when :spell
      player.power_up(1)
      puts "You have found a powerful spell! Your new power: #{player.power}."
    when :poison
      player.hit(10)
      puts 'You have got infected with poison! Lost 10 HP.'
    when :converter
      puts "You find \"the converter\", a ancestral item who convert HP to POWER, you'r convert 20 HP to 5 POWER."
      if player.health > 20
        player.hit(20)
        player.power_up(5)
      else
        puts 'Not enough life'
      end
    end
  end
end
