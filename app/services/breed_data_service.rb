# frozen_string_literal: true

class BreedDataService < ApplicationService
  attr_reader :breed_name, :breed_data

  BASE_URL = 'https://dogapi.dog/api/v2'
  public_constant :BASE_URL

  BREEDS_URL = "#{BASE_URL}/breeds".freeze
  public_constant :BREEDS_URL

  def initialize(breed_name:)
    @breed_name = breed_name
    @breed_data = nil
  end

  def call
    get_breed_data
  end

  private

  def get_breed_data
    resp = self.class.get(BREEDS_URL)

    return unless resp.success?

    breed_data = resp['data'].find { |breed| breed['attributes']['name'] == breed_name }
    next_call = resp['links']['next']

    while next_call.present? && breed_data.nil?
      resp = self.class.get(next_call)

      breed_data = resp['data'].find { |breed| breed['attributes']['name'] == breed_name }
      next_call = resp['links']['next']
    end

    breed_data
  end
end
