# frozen_string_literal: true

require 'rails_helper'

describe 'Users', type: :request do
  let(:user) { create(:user) }

  describe 'GET /index' do
    it 'succeeds' do
      get users_path
      expect(response).to be_successful
    end
  end

  describe 'GET /users/:id' do
    it 'succeeds' do
      get users_path(user)
      expect(response).to be_successful
    end
  end

  describe 'GET /users/:id/edit' do
    it 'succeeds' do
      get edit_user_path(user)
      expect(response).to be_successful
    end
  end

  describe 'PUT /users/:id' do
    let(:params) do
      {
        user: {
          name: 'new name'
        }
      }
    end

    it 'succeeds' do
      put(user_path(user), params:)
      expect(user.reload).to have_attributes(params[:user])
    end
  end

  describe 'DELETE user/:id' do
    it 'succeeds' do
      delete user_path(user)
      expect(response).to change(User, :count).from(1).to(0) && redirect_to(users_path)
    end
  end
end
