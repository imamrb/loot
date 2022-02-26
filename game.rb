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
    @player = Player.new({ lat: LAT, long: LONG, rows: ROWS, columns: COLUMNS, world: @world })
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
      Command.call(self, cmd)
    end
  end
end

Game.play
