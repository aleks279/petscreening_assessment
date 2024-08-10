# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Clear existing data
Pet.destroy_all

# Create pets
Pet.create!(
  [
    { name: 'Buddy', kind: 'Dog', breed: 'Golden Retriever' },
    { name: 'Whiskers', kind: 'Cat', breed: 'Siamese' },
    { name: 'Tweety', kind: 'Bird', breed: 'Canary' },
    { name: 'Nemo', kind: 'Fish', breed: 'Clownfish' }
  ]
)

puts "Created #{Pet.count} pets"
