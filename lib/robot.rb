# implements Robot class
class Robot
  attr_accessor :position

  def initialize
    @position = nil
  end

  def placed?
    !@position.nil?
  end

  def report
    if !placed?
      'robot not placed or out of boundaries'
    else
      [
        @position.x,
        @position.y,
        @position.direction].join(',')
    end
  end
end
