require 'spec_helper'
require 'place_command'
require 'right_command'
require 'position'
require 'robot'
require 'world'

describe RightCommand do
  describe '#execute' do
    let(:robot) { Robot.new }
    let(:world) { World.new(5, 5) }
    let(:right_command) { RightCommand.new(robot) }

    it 'when facing WEST turns NORTH' do
      position = Position.new(1, 1, 'WEST')
      PlaceCommand.new(robot, world, position).execute
      right_command.execute

      expect(robot.report).to eq('1,1,NORTH')
    end

    it 'when facing NORTH turns EAST' do
      position = Position.new(1, 1, 'NORTH')
      PlaceCommand.new(robot, world, position).execute
      right_command.execute

      expect(robot.report).to eq('1,1,EAST')
    end

    it 'when facing EAST turns SOUTH' do
      position = Position.new(1, 1, 'EAST')
      PlaceCommand.new(robot, world, position).execute
      right_command.execute

      expect(robot.report).to eq('1,1,SOUTH')
    end

    it 'when facing SOUTH turns WEST' do
      position = Position.new(1, 1, 'SOUTH')
      PlaceCommand.new(robot, world, position).execute
      right_command.execute

      expect(robot.report).to eq('1,1,WEST')
    end
  end
end
