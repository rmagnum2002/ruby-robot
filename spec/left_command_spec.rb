require 'spec_helper'
require 'left_command'
require 'position'
require 'place_command'
require 'robot'
require 'world'

describe LeftCommand do
  describe '#execute' do
    let(:robot) { Robot.new }
    let(:world) { World.new(5, 5) }
    let(:left_command) { LeftCommand.new(robot) }

    it 'when looking NORTH turns WEST' do
      position = Position.new(1, 1, 'NORTH')
      PlaceCommand.new(robot, world, position).execute
      left_command.execute

      expect(robot.report).to eq('1,1,WEST')
    end

    it 'when looking EAST turns NORTH' do
      position = Position.new(1, 1, 'EAST')
      PlaceCommand.new(robot, world, position).execute
      left_command.execute

      expect(robot.report).to eq('1,1,NORTH')
    end

    it 'when looking SOUTH turns EAST' do
      position = Position.new(1, 1, 'SOUTH')
      PlaceCommand.new(robot, world, position).execute
      left_command.execute

      expect(robot.report).to eq('1,1,EAST')
    end

    it 'when looking WEST turns SOUTH' do
      position = Position.new(1, 1, 'WEST')
      PlaceCommand.new(robot, world, position).execute
      left_command.execute

      expect(robot.report).to eq('1,1,SOUTH')
    end
  end
end
