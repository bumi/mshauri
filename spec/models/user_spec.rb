# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do

  context "Associations" do
    it { should have_many(:iterations) }
  end


  context "Validations" do
    # Basic validations
    it { should validate_uniqueness_of(:slug) }
    # Inclusion/acceptance of values
  end
end
