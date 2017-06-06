require 'spec_helper'
require 'place_command'
require 'robot'
require 'world'
require 'position'

describe PlaceCommand do
  describe '#execute' do
    let(:robot) { Robot.new }
    let(:world) { World.new(5, 5) }
    let(:place_command) { PlaceCommand.new(robot, world, position) }

    context 'with valid position' do
      let(:position) { Position.new(1, 1, 'NORTH') }

      it 'places robot ' do
        place_command.execute

        expect(robot.report).to eq('1,1,NORTH')
      end
    end

    context 'with INVALID position' do
      let(:position) { Position.new(-1, 1, 'NORTH') }

      it 'places robot ' do
        place_command.execute

        expect(robot.report).to eq('robot not placed or out of boundaries')
      end
    end
  end
end
