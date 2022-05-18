# frozen_string_literal: true

require_relative 'spec_helper'

BOSS_POWER = 8
BOSS_HEALTH = 50

RSpec.describe Enemy do
  let(:enemy) { Enemy.new({ boss: true }) }

  it 'inherits behavior from Parent' do
    expect(described_class.superclass).to eq(Character)
  end

  describe '.initalize' do
    it 'returns a valid enemy' do
      expect(enemy.name).to be_a(String)
      expect(enemy.health).to eq BOSS_HEALTH
      expect(enemy.power).to eq BOSS_POWER
    end
  end

  describe 'inherited methods from Character' do
    context '.hit' do
      it 'decreases enemy health' do
        enemy.hit(SAMPLE_HIT_VALUE)
        expect(enemy.health).to eq BOSS_HEALTH - SAMPLE_HIT_VALUE
      end
    end

    context '.alive?' do
      it 'returns true if enemy is alive' do
        expect(enemy.alive?).to be_truthy
      end

      it 'returns false if enemy is dead' do
        enemy.hit(BOSS_HEALTH)
        expect(enemy.alive?).to be_falsey
      end
    end
  end
end
