# frozen_string_literal: true

# Handle event related commands
class EventHandler
  def self.call(action, room, player)
    raise InvalidAction, UI.not_in_a_event_room unless room.event

    case action
    when 'yes'
      room.event.perform(player)
    when 'no'
      UI.skipped_the_event
    end

    room.mark_complete
    player.status
  end
end
