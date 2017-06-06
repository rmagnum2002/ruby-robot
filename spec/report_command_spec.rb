require 'spec_helper'
require 'robot'
require 'world'

describe ReportCommand do
  describe '#execute' do
    let(:robot) { Robot.new }
    let(:world) { World.new(5, 5) }

    context 'with valid position' do
      let!(:position) { Position.new(1, 1, 'NORTH') }

      it 'prints report to stdout' do
        PlaceCommand.new(robot, world, position).execute

        expect { ReportCommand.new(robot).execute }.to output(
          "1,1,NORTH\n").to_stdout
      end
    end

    context 'with invalid position' do
      let!(:position) { Position.new(-1, 1, 'NORTH') }

      it 'prints report to stdout' do
        PlaceCommand.new(robot, world, position).execute

        expect { ReportCommand.new(robot).execute }.to output(
          "robot not placed or out of boundaries\n").to_stdout
      end
    end
  end
end
