# frozen_string_literal: true

FactoryBot.define do
  factory :pet do
    name { Faker::Creature::Dog.name }
    kind { 'Dog' }
    breed { Faker::Creature::Dog.breed }
  end
end
