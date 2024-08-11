# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :last_name, :id_number, presence: true
  validates :id_number, uniqueness: true

  has_many :pets, dependent: :nullify
end
