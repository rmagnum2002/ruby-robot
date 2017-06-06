# implements commander class
class Commander
  def initialize(robot, world)
    @robot = robot
    @world = world
  end

  def parse(command)
    if command =~ /^PLACE\s+\d+\s*,\s*\d+\s*,\s*(NORTH|SOUTH|EAST|WEST)$/
      place_command(command)
    elsif command =~ /^MOVE$/
      MoveCommand.new(@robot, @world)
    elsif command =~ /^(RIGHT|LEFT|REPORT)$/
      Object.const_get([command.capitalize, 'Command'].join).new(@robot)
    end
  end

  private

  def place_command(command)
    _command, x, y, direction = command.tr(',', ' ').split
    PlaceCommand.new(@robot, @world, Position.new(x.to_i, y.to_i, direction))
  end
end
