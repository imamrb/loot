class Settings
  ROWS = 3
  COLUMNS = 3

  def self.rows
    ROWS
  end

  def self.columns
    COLUMNS
  end

  def self.initial_coordinates
    [ROWS / 2, COLUMNS / 2]
  end
end
