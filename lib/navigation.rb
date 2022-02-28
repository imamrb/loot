# frozen_string_literal: true

# Calculate new location and assign new room for the world
class Navigation
  attr_accessor :game, :world, :player, :direction

  def initialize(direction, game)
    @game = game
    @world = game.world
    @player = game.player
    @direction = direction
  end

  def self.call(direction, game)
    new(direction, game).call
  end

  def call
    lat, long = player.move(direction)

    already_completed = world.visited?(lat, long)
    world.visit(lat, long) unless already_completed

    game.room = assign_room(lat, long, already_completed)
  end

  private

  def assign_room(lat, long, already_completed)
    Room.new({ lat: lat, long: long, completed: already_completed, world: world })
  end
end
