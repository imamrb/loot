# frozen_string_literal: true

Dir['lib/*.rb'].each { |file| require_relative file }

# Runs the main process of the game
class Game
  attr_accessor :running, :world, :player, :room

  MAP_ROWS = 3
  MAP_COLUMNS = 3
  INITIAL_LATITUDE = MAP_ROWS / 2
  INITIAL_LONGITUDE = MAP_COLUMNS / 2

  def initialize
    @running = true
    @world = World.new(world_params)
    @player = Player.new(player_params)
    @room = Room.new(room_params)
  end

  def self.play
    new.play
  end

  def play
    name = UI.ask("What's your name? : ")
    player.name = name

    UI.welcome(player.name)

    execute_cmd(:status)
    execute_cmd(:wmi)

    while running
      cmd = UI.get_cmd
      execute_cmd(cmd.to_sym)

      if player.dead?
        UI.player_lost; break
      elsif world.conqured?(room)
        UI.player_won; break
      end
    end
  end

  private

  def error_handler
    yield
  rescue StandardError => e
    puts e.to_s
  end

  def game_over?
    player.dead? || world.conqured?(room)
  end

  def execute_cmd(cmd)
    error_handler do
      case cmd
      when :map
        world.show_map
        room.location_info
        UI.navigation_help
      when :location
        room.location_info
      when :wmi
        world.show_map
        room.location_info
        room.info
      when :exit
        UI.exit
        self.running = false
      when :help
        UI.help(room)
      when :status
        player.status
      when :fight, :run
        PlayerAction.call(cmd, room, player)
        execute_cmd(:map) unless game_over?
      when :yes, :no
        EventAction.call(cmd, room, player)
        execute_cmd(:map) unless game_over?
      when :up, :down, :left, :right
        if room.completed && player.can_move?(cmd)
          Navigation.call(cmd, self)
          execute_cmd(:wmi)
        elsif !player.can_move?(cmd)
          UI.area_out_of_bounds
        else
          UI.clear_this_room_first
        end
      else
        UI.invalid_action
      end
    end
  end

  def world_params
    { rows: MAP_ROWS, columns: MAP_COLUMNS }
  end

  def player_params
    { lat: INITIAL_LATITUDE, long: INITIAL_LONGITUDE, world: world }
  end

  def room_params
    { lat: INITIAL_LATITUDE, long: INITIAL_LONGITUDE, world: world }
  end
end

Game.play
