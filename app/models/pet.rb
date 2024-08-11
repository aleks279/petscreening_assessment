# frozen_string_literal: true

class Pet < ApplicationRecord
  belongs_to :user

  DOG = 'dog'
  public_constant :DOG

  def is_dog?
    kind.downcase == DOG
  end
end
