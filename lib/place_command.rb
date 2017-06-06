# implements place command class
class PlaceCommand
  def initialize(robot, world, position)
    @robot = robot
    @world = world
    @position = position
  end

  def execute
    @robot.position = @position if @world.position_is_valid?(@position)
  end
end
