# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Iteration, type: :model do
  context 'when creating' do
    it 'with user' do
      user = FactoryBot.create(:user)
      expect(user.iterations.create).to be_valid
    end
  end
end
