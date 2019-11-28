require 'rails_helper'

RSpec.describe Question, type: :model do
  # context 'Validations' do
  #   # Basic validations
  #   it { should validate_presence_of(:title) }
  #   it { should_not validate_presence_of(:description) }
  #
  # end

  context 'Can create Question' do
    it 'should have all the validations' do
      expect(Question.create(title: 'new', description: 'do u use any IDE')).to be_valid
    end
  end
end
