# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Event do
  let(:event) { Event.new }

  describe '.initalize' do
    it 'returns a valid event' do
      expect(event.type).to be_a(Symbol)
      expect(event.storage).to be_a(String)
      expect(event.location).to be_a(String)
    end
  end
end
