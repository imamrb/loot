class Command
  def self.call(game, command)
    case command
    when 'map', 'm'
      game.world.show_map
    when 'exit', 'quit', 'q', 'e'
      game.ui.exit
      game.running = false
    when 'help', 'h'
      game.ui.help
    when 'fight', 'f'
      game.player.fight
    when 'run', 'r'
      game.player.run
    when 'up', 'down', 'right', 'left'
      @room  = game.player.move(command)
      puts @room.info
    end
  end
end
