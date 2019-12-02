# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Iteration, type: :model do
  context "Create iteration" do
    it 'should have user' do
      user=FactoryBot.create(:user)
      expect(user.iterations.create).to be_valid
    end
  end
end
