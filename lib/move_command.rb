# implements MoveCommand
class MoveCommand
  def initialize(robot, world)
    @robot = robot
    @world = world
  end

  def execute
    if @robot.placed?
      new_position = @robot.position.go_to(@robot.position.direction)

      @robot.position = new_position if @world.position_is_valid?(new_position)
    end
  end
end
