# frozen_string_literal: true

require_relative 'spec_helper'

MAX_HEALTH = 100
MAX_POWER = 10
SAMPLE_HIT_VALUE = 5
LAT =  1
LONG = 1

RSpec.describe Player do
  let(:world) { World.new({ rows: 3, columns: 3 }) }
  let(:player) { Player.new({ lat: LAT, long: LONG, world: world, name: 'Player' }) }

  it 'inherits behavior from Parent' do
    expect(described_class.superclass).to eq(Character)
  end

  describe '.initalize' do
    it 'returns valid player' do
      expect(player.name).to eq 'Player'
      expect(player.health).to eq MAX_HEALTH
      expect(player.power).to eq MAX_POWER
      expect(player.lat).to eq LAT
      expect(player.long).to eq LONG
    end
  end

  describe 'inherited methods from Character' do
    context '.hit' do
      it 'decreases player health' do
        player.hit(SAMPLE_HIT_VALUE)
        expect(player.health).to eq MAX_HEALTH - SAMPLE_HIT_VALUE
      end
    end

    context '.alive?' do
      it 'returns true if player is alive' do
        player.heal(MAX_HEALTH)
        expect(player.alive?).to be_truthy
      end

      it 'returns false if player is dead' do
        player.hit(MAX_HEALTH)
        expect(player.alive?).to be_falsey
      end
    end
  end

  describe '.heal' do
    it 'increases player health up to the maximum value' do
      player.hit(SAMPLE_HIT_VALUE)
      player.heal(SAMPLE_HIT_VALUE)
      expect(player.health).to eq MAX_HEALTH
      player.heal(SAMPLE_HIT_VALUE)
      expect(player.health).to eq MAX_HEALTH
    end
  end

  describe '.current_pos' do
    it 'return player\'\s current lattitude and longitude' do
      expect(player.current_pos).to eq([LAT, LONG])
    end
  end

  describe '.power_up' do
    it 'powers up the player power' do
      player.power_up(5)
      expect(player.power).to eq(MAX_POWER + 5)
    end
  end

  describe '.can_move?' do
    context 'when player is on the edge of the map' do
      let(:player) { Player.new({ lat: 0, long: 0, world: world }) }

      it 'returns true if the position is within the map' do
        expect(player.can_move?(:right)).to be_truthy
        expect(player.can_move?(:down)).to be_truthy
        expect(player.can_move?(:up)).to be_falsey
        expect(player.can_move?(:left)).to be_falsey
      end
    end

    context 'when player is on the middle of the map' do
      let(:player) { Player.new({ lat: 1, long: 1, world: world }) }

      it 'returns true for all direction' do
        expect(player.can_move?(:right)).to be_truthy
        expect(player.can_move?(:down)).to be_truthy
        expect(player.can_move?(:up)).to be_truthy
        expect(player.can_move?(:left)).to be_truthy
      end
    end
  end

  describe '.move' do
    let(:player) { Player.new({ lat: 1, long: 1, world: world }) }

    it 'returns the new coordinates after move' do
      expect(player.move(:right)).to eq([LAT, LONG + 1])
      expect(player.move(:up)).to eq([LAT - 1, LONG + 1])
      expect(player.move(:left)).to eq([LAT - 1, LONG])
      expect(player.move(:down)).to eq([LAT, LONG])
    end
  end
end
