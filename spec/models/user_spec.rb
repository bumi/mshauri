# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with associations' do
    it { is_expected.to have_many(:iterations) }
  end

  context 'with alidations' do
    # Basic validations
    it { is_expected.to validate_uniqueness_of(:slug) }
    # Inclusion/acceptance of values
  end
end
