# implements LeftCommand
class LeftCommand
  def initialize(robot)
    @robot = robot
  end

  def execute
    if @robot.placed?
      @robot.position = Position.new(
        @robot.position.x,
        @robot.position.y,
        @robot.position.direction_left)
    end
  end
end
