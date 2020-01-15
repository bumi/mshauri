# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, type: :model do
  # context 'Validations' do
  #   # Basic validations
  #   it { should validate_presence_of(:title) }
  #   it { should_not validate_presence_of(:description) }
  #
  # end
  context 'with associations' do
    it { is_expected.to have_many(:answers) }
  end

  context 'with validations' do
    record = described_class.create()
    record.valid? # run validations
  end

  context 'when creating a question' do
    it 'has all the validations' do
      expect(described_class.create(title: 'new', description: 'do you use any IDE')).to be_valid
    end
  end
end
