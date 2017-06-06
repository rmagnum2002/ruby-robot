# $LOAD_PATH.unshift "#{File.dirname(__FILE__)}/lib"
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

world = World.new
robot = Robot.new
commander = Commander.new(robot, world)

puts 'type command (EXIT to quit): '

loop do
  input = gets.chomp!
  command = commander.parse(input)
  command.execute unless command.nil?

  break if input =~ /exit/i
end
