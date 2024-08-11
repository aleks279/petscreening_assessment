# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:id_number) }

    it { is_expected.to validate_uniqueness_of(:id_number) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:pets) }
  end
end
