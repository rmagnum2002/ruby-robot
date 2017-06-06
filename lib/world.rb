# implements World class
class World
  attr_reader :width, :length

  def initialize(width = 5, length = 5)
    @width = width
    @length = length
  end

  def position_is_valid?(position)
    position.x.between?(0, @length - 1) &&
      position.y.between?(0, @width - 1)
  end
end
