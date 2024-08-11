# frozen_string_literal: true

require 'rails_helper'

describe 'Pets', type: :request do
  let(:pet) { create(:pet) }

  describe 'GET /index' do
    it 'succeeds' do
      get pets_path
      expect(response).to be_successful
    end
  end

  describe 'GET /pets/:id' do
    it 'succeeds' do
      get pets_path(pet)
      expect(response).to be_successful
    end
  end

  describe 'GET /pets/:id/edit' do
    it 'succeeds' do
      get edit_pet_path(pet)
      expect(response).to be_successful
    end
  end

  describe 'PUT /pets/:id' do
    let(:params) do
      {
        pet: {
          name: 'new name'
        }
      }
    end

    it 'succeeds' do
      put(pet_path(pet), params:)
      expect(pet.reload).to have_attributes(params[:pet])
    end
  end

  describe 'DELETE pet/:id' do
    it 'succeeds' do
      delete pet_path(pet)
      expect(response).to change(Pet, :count).from(1).to(0) && redirect_to(pets_path)
    end
  end
end
