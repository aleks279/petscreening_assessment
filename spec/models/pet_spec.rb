# frozen_string_literal: true

require 'rails_helper'

describe Pet, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
