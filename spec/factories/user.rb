# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.male_first_name }
    last_name { Faker::Name.last_name }
    phone { Faker::PhoneNumber.phone_number }
    address { Faker::Address.full_address }
    id_number { Faker::IdNumber.valid }
  end
end
