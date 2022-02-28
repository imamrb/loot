# frozen_string_literal: true

# Defines error classes
class BaseError < StandardError
  def initialize(message)
    super
    @message = message
  end

  def to_s
    @message
  end
end

class InvalidAction < BaseError; end
