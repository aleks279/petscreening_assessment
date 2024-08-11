# frozen_string_literal: true

class ApplicationService
  include HTTParty

  def self.call(*args, &block)
    new(*args, &block).call
  end
end
