# frozen_string_literal: true

require_relative 'loot/character'
require_relative 'loot/enemy'
require_relative 'loot/errors'
require_relative 'loot/event'
require_relative 'loot/event_action'
require_relative 'loot/navigation'
require_relative 'loot/player'
require_relative 'loot/player_action'
require_relative 'loot/room'
require_relative 'loot/ui'
require_relative 'loot/world'

require_relative 'loot/game'

module Loot
  class Error < StandardError; end
  # Your code goes here...
end
