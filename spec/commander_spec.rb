require 'spec_helper'
require 'commander'
require 'world'
require 'report_command'
require 'position'
require 'place_command'
require 'robot'
require 'move_command'
require 'left_command'
require 'right_command'

describe Commander do
  let(:robot) { Robot.new }
  let(:world) { World.new(5, 5) }
  let(:commander) { Commander.new(robot, world) }

  describe '#parse' do
    context 'when placing robot' do
      report = 'PLACE 1, 1, NORTH'

      it 'creates command with valid arguments' do
        position = instance_double('Position', x: 1, y: 1, direction: 'NORTH')
        expect(Position).to receive(:new).with(
          1, 1, 'NORTH').and_return(position)
        expect(PlaceCommand).to receive(:new).with(
          robot, world, position)

        commander.parse(report)
      end

      it 'returns command' do
        expect(commander.parse(report)).to be_a PlaceCommand
      end
    end

    context 'INVALID command' do
      it 'returns nil' do
        command = 'invalidcommand'

        expect(commander.parse(command)).to be nil
      end
    end

    context 'RIGHT command' do
      command = 'RIGHT'

      it 'creates command with the correct arguments' do
        expect(RightCommand).to receive(:new).with(robot)

        commander.parse(command)
      end

      it 'returns command' do
        expect(commander.parse(command)).to be_a RightCommand
      end
    end

    context 'LEFT command' do
      command = 'LEFT'

      it 'creates command with the correct arguments' do
        expect(LeftCommand).to receive(:new).with(robot)

        commander.parse(command)
      end

      it 'returns command' do
        expect(commander.parse(command)).to be_a LeftCommand
      end
    end

    context 'MOVE command' do
      command = 'MOVE'

      it 'creates command with the correct arguments' do
        expect(MoveCommand).to receive(:new).with(robot, world)

        commander.parse(command)
      end

      it 'returns command' do
        expect(commander.parse(command)).to be_a MoveCommand
      end
    end

    context 'REPORT command' do
      command = 'REPORT'

      it 'creates command with the correct arguments' do
        expect(ReportCommand).to receive(:new).with(robot)

        commander.parse(command)
      end

      it 'returns command' do
        expect(commander.parse(command)).to be_a ReportCommand
      end
    end
  end
end
