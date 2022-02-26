Dir['lib/*.rb'].each { |file| require_relative file }

class Game
  attr_accessor :running, :world, :ui, :player

  ROWS = Settings.rows
  COLUMNS = Settings.columns
  LAT, LONG = Settings.initial_coordinates

  def initialize
    @running = true
    @ui = UI.new
    @world = World.new({ rows: ROWS, columns: COLUMNS })
    @player = Player.new({ lat: LAT, long: LONG, world: @world })
  end

  def self.play
    new.play
  end

  def play
    name = ui.ask("What's your name? ")
    ui.welcome(name)

    player.name = name

    while running
      cmd = ui.get_cmd
      execute_cmd(cmd)
    end
  end

  private

  def execute_cmd(cmd)
    case cmd
    when 'map', 'm'
      world.show_map
    when 'exit', 'quit', 'q', 'e'
      ui.exit
      self.running = false
    when 'help', 'h'
      ui.help
    when 'fight', 'f'
      player.fight
    when 'run', 'r'
      player.run
    when 'up', 'down', 'right', 'left'
      @room = player.move(cmd)
      puts @room.info
    end
  end
end

Game.play
