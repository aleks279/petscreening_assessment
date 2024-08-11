# frozen_string_literal: true

require 'rails_helper'

describe BreedDataService do
  subject(:call) { described_class.new(breed_name: pet.breed).call }

  let(:base_url) { described_class::BREEDS_URL }
  let(:page_1_url) { "#{base_url}?page=1" }
  let(:page_2_url) { "#{base_url}?page=2" }

  let(:first_page) do
    {
      'data': [
        {
          'id': 'id',
          'attributes': {
            'name': 'Golden Retriever',
            'description': 'description',
            'life': {
              'max': 20,
              'min': 15
            },
            'male_weight': {
              'max': 90,
              'min': 50
            },
            'female_weight': {
              'max': 70,
              'min': 45
            },
            'hypoallergenic': false
          }
        }
      ],
      'links': {
        'current': page_1_url,
        'next': page_2_url
      }
    }
  end
  let(:second_page) do
    {
      'data': [
        {
          'id': 'id',
          'attributes': {
            'name': 'Bloodhound',
            'description': 'description',
            'life': {
              'max': 20,
              'min': 15
            },
            'male_weight': {
              'max': 90,
              'min': 50
            },
            'female_weight': {
              'max': 70,
              'min': 45
            },
            'hypoallergenic': false
          }
        }
      ],
      'links': {
        'current': page_2_url
      }
    }
  end

  before do
    stub_request(:get, base_url).to_return(status: 200, body: first_page.to_json,
                                           headers: { 'Content-Type' => 'application/json' })
    stub_request(:get, page_2_url).to_return(status: 200, body: second_page.to_json,
                                             headers: { 'Content-Type' => 'application/json' })
  end

  context 'when the breed is in the first response' do
    let(:pet) { create(:pet, kind: 'Dog', breed: 'Golden Retriever') }

    it { expect(call).to eq(first_page[:data].first.deep_stringify_keys) }
  end

  context 'when the breed is in subbsequent response' do
    let(:pet) { create(:pet, kind: 'Dog', breed: 'Bloodhound') }

    it { expect(call).to eq(second_page[:data].first.deep_stringify_keys) }
  end

  context 'when the breed is not found' do
    let(:pet) { create(:pet, kind: 'Dog', breed: 'Non-existent') }

    it 'returns nil' do
      expect(call).to be_nil
    end
  end
end
