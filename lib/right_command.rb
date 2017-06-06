# implements RightCommand
class RightCommand
  def initialize(robot)
    @robot = robot
  end

  def execute
    if @robot.placed?
      @robot.position = Position.new(
        @robot.position.x,
        @robot.position.y,
        @robot.position.direction_right)
    end
  end
end
