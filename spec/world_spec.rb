# frozen_string_literal: true

require_relative 'spec_helper'

ROWS = 3
COLUMNS = 3

RSpec.describe World do
  let(:world) { World.new({ rows: ROWS, columns: COLUMNS }) }
  let(:map) { world.map }

  describe '.initialize' do
    it 'returns a new world' do
      expect(world.rows).to eq(ROWS)
      expect(world.rows).to eq(COLUMNS)
      expect(world.map).to be_an(Array)
    end
  end

  describe '.visit' do
    it 'marks the room as visited' do
      expect(map[1][1]).to eq('X')
      world.visit(1, 1)
      expect(map[1][1]).to eq('O')
    end
  end

  describe '.visited?' do
    it 'returns true or false according to the map state' do
      expect(world.visited?(1, 1)).to be_falsey
      world.visit(1, 1)
      expect(world.visited?(1, 1)).to be_truthy
    end
  end

  describe '.valid_location?' do
    it 'returns true if withing map area' do
      expect(world.valid_location?(3, 4)).to be_falsey
      expect(world.valid_location?(1, 1)).to be_truthy
    end
  end

  describe '.conqured?' do
    let(:last_room) { Room.new({ world: world, lat: 3, long: 3, completed: true }) }

    it 'returns true if the last room is conqured' do
      world.map = Array.new(3) { Array.new(3, 'O') }

      expect(world.conqured?(last_room)).to be_truthy
      last_room.completed = false
      expect(world.conqured?(last_room)).to be_falsey
    end

    it 'returns false if all room is not visited yet' do
      expect(world.conqured?(last_room)).to be_falsey
      world.map = Array.new(3) { Array.new(3, 'O') }
      expect(world.conqured?(last_room)).to be_truthy
    end
  end

  describe '.move_location' do
    it 'returns the new coordinates relative to the given coordinates' do
      expect(world.move_location(:up, 1, 1)).to eq([0, 1])
      expect(world.move_location(:down, 1, 1)).to eq([2, 1])
      expect(world.move_location(:left, 1, 1)).to eq([1, 0])
      expect(world.move_location(:right, 1, 1)).to eq([1, 2])
    end
  end
end
