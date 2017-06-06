require 'spec_helper'
require 'robot'
require 'place_command'
require 'position'
require 'left_command'
require 'right_command'
require 'move_command'
require 'world'

describe Robot do
  let(:robot) { Robot.new }
  let(:world) { World.new(5, 5) }

  describe '#place' do
    before do
      PlaceCommand.new(robot, world, position).execute
    end

    context 'with invalid position' do
      let(:position) { Position.new(9, 9, 'NORTH') }

      it 'will not place robot' do
        expect(robot.position).to be nil
      end
    end

    context 'with valid position' do
      let(:position) { Position.new(2, 3, 'NORTH') }

      it 'places robot in the correct position' do
        expect(robot.position).to eq(position)
      end
    end
  end

  describe '#placed?' do
    context 'before robot is placed' do
      it 'returns false' do
        expect(robot.placed?).to be false
      end
    end

    context 'after robot is placed' do
      it 'returns true' do
        PlaceCommand.new(robot, world, Position.new(1, 2, 'EAST')).execute

        expect(robot.placed?).to be true
      end
    end
  end

  describe '#report' do
    let(:position) { Position.new(1, 1, 'NORTH') }

    context 'before placing the robot' do
      it 'returns error message' do
        expect(robot.report).to eq('robot not placed or out of boundaries')
      end
    end

    context 'after placing the robot' do
      it 'returns position of the robot' do
        PlaceCommand.new(robot, world, position).execute

        expect(robot.report).to eq('1,1,NORTH')
      end
    end
  end

  describe '#execute_command' do
    context 'when not placed or outside world boundaries' do
      it 'ignores other commands' do
        MoveCommand.new(robot, world).execute
        LeftCommand.new(robot).execute
        RightCommand.new(robot).execute

        expect(robot.report).to eq('robot not placed or out of boundaries')
      end
    end

    context 'when placed within boundaries' do
      it 'turns to the left' do
        position = Position.new(1, 1, 'NORTH')
        PlaceCommand.new(robot, world, position).execute
        LeftCommand.new(robot).execute

        expect(robot.report).to eq('1,1,WEST')
      end

      it 'turns to the right' do
        position = Position.new(1, 1, 'NORTH')
        PlaceCommand.new(robot, world, position).execute
        RightCommand.new(robot).execute

        expect(robot.report).to eq('1,1,EAST')
      end

      it 'moves NORTH' do
        position = Position.new(1, 1, 'NORTH')
        PlaceCommand.new(robot, world, position).execute
        MoveCommand.new(robot, world).execute

        expect(robot.report).to eq('1,2,NORTH')
      end

      it 'moves SOUTH' do
        position = Position.new(1, 1, 'SOUTH')
        PlaceCommand.new(robot, world, position).execute
        MoveCommand.new(robot, world).execute

        expect(robot.report).to eq('1,0,SOUTH')
      end

      it 'moves EAST' do
        position = Position.new(1, 1, 'EAST')
        PlaceCommand.new(robot, world, position).execute
        MoveCommand.new(robot, world).execute

        expect(robot.report).to eq('2,1,EAST')
      end

      it 'moves WEST' do
        position = Position.new(1, 1, 'WEST')
        PlaceCommand.new(robot, world, position).execute
        MoveCommand.new(robot, world).execute

        expect(robot.report).to eq('0,1,WEST')
      end
    end
  end
end
