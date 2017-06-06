# implements Position class
class Position
  attr_reader :x, :y, :direction

  DIRECTIONS = %w(NORTH EAST SOUTH WEST).freeze

  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def go_to(direction)
    case direction
    when 'NORTH'
      go_north
    when 'EAST'
      go_east
    when 'SOUTH'
      go_south
    when 'WEST'
      go_west
    end
  end

  def direction_left
    DIRECTIONS[(DIRECTIONS.index(direction) - 1) % 4]
  end

  def direction_right
    DIRECTIONS[(DIRECTIONS.index(direction) + 1) % 4]
  end

  def ==(other)
    @x == other.x && @y == other.y && @direction == other.direction
  end

  private

  def go_north
    Position.new(@x, @y + 1, @direction)
  end

  def go_south
    Position.new(@x, @y - 1, @direction)
  end

  def go_west
    Position.new(@x - 1, @y, @direction)
  end

  def go_east
    Position.new(@x + 1, @y, @direction)
  end
end
