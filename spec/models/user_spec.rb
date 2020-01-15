# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with associations' do
    it { is_expected.to have_many(:iterations) }
  end

  context 'with validations' do
    # Basic validations
    it { is_expected.to validate_uniqueness_of(:slug) }
    # Inclusion/acceptance of values
  end

  context 'when creating user' do
    it 'is valid' do
      user = FactoryBot.create(:user, name: 'name')
      expect(user.name).to eq 'name'
    end
  end

  context 'when creating a user' do
    it ' user slug is valid' do
      user = FactoryBot.create(:user, name: 'name', email: 'name@gmail.com')
      expect(user.slug).should_not be_nil
    end
  end
end
