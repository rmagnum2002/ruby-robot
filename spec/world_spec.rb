require 'spec_helper'
require 'world'
require 'position'

describe World do
  describe '#position_is_valid?' do
    let(:world) { World.new(5, 5) }

    it 'returns true when x and y valid' do
      position = Position.new(2, 3, 'NORTH')

      expect(world.position_is_valid?(position)).to be true
    end

    it 'returns false when x and y are valid' do
      position = Position.new(6, 8, 'NORTH')

      expect(world.position_is_valid?(position)).to be false
    end

    it 'returns false when x too big' do
      position = Position.new(6, 4, 'NORTH')

      expect(world.position_is_valid?(position)).to be false
    end

    it 'returns false when y too big' do
      position = Position.new(3, 6, 'NORTH')

      expect(world.position_is_valid?(position)).to be false
    end

    it 'returns false when x is negative' do
      position = Position.new(-3, 4, 'NORTH')

      expect(world.position_is_valid?(position)).to be false
    end

    it 'returns false when y is negative' do
      position = Position.new(3, -2, 'NORTH')

      expect(world.position_is_valid?(position)).to be false
    end

    it 'returns false when x and y are negative' do
      position = Position.new(-3, -2, 'NORTH')

      expect(world.position_is_valid?(position)).to be false
    end
  end
end
