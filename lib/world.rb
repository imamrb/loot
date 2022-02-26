class World
  attr_accessor :map, :stats, :rows, :columns, :visited_rooms

  def initialize(rows:, columns:)
    @rows = rows
    @columns = columns
    @map = generate_map
  end

  def show_map
    print "\n\n"

    map.each do |line|
      print line
      print "\n"
    end

    print "\n"
  end

  def visit(lat, long)
    map[lat][long] = 'O'
  end

  def visited?(lat, long)
    map[lat][long] == 'O'
  end

  def valid_location?(lat, long)
    lat < rows && x >= 0 && long < columns && long >= 0
  end

  def last_room?
    false
  end

  def move_location(direction, x, y)
    case direction
    when 'up'
      x -= 1
    when 'down'
      x += 1
    when 'right'
      y += 1
    when 'left'
      y -= 1
    end

    [x, y]
  end

  private

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
