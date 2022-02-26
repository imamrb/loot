class World
  attr_accessor :map, :stats, :rows, :columns, :visited_rooms

  def initialize(args)
    @rows = args[:rows]
    @columns = args[:columns]
    @map = generate_map
    @visited_rooms = 1
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
    self.visited_rooms += 1
  end

  def visited?(lat, long)
    map[lat][long] == 'O'
  end

  def last_room?
    false
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
