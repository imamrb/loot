# frozen_string_literal: true

# World consists of many rooms
class World
  attr_accessor :map, :stats, :rows, :columns

  def initialize(rows:, columns:)
    @rows = rows
    @columns = columns
    @map = generate_map
  end

  def show_map
    UI.new_line
    puts '*' * 10 + ' MAP ' + '*' * 10
    map.each do |line|
      print ' ' * 4
      print line
      print "\n"
    end
    puts '*' * 25
    UI.map_info
    UI.new_line
  end

  def visit(lat, long)
    map[lat][long] = 'O'
  end

  def visited?(lat, long)
    map[lat][long] == 'O'
  end

  def valid_location?(lat, long)
    lat < rows && long >= 0 && long < columns && long >= 0
  end

  def last_room?
    visited_rooms_count == total_rooms
  end

  def conqured?(last_room)
    visited_rooms_count == total_rooms && last_room.completed
  end

  def move_location(direction, x, y)
    case direction
    when :up
      x -= 1
    when :down
      x += 1
    when :right
      y += 1
    when :left
      y -= 1
    end

    [x, y]
  end

  private

  def total_rooms
    rows * columns
  end

  def visited_rooms_count
    visit_count = 0

    rows.times do |r|
      columns.times do |c|
        visit_count += 1 if map[r][c] == 'O'
      end
    end

    visit_count
  end

  def generate_map
    tmp_map = []

    rows.times do
      line = []
      columns.times { line << 'X' }

      tmp_map << line
    end

    tmp_map
  end
end
