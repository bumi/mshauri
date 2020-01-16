# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::QuestionsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  describe 'GET' do
    it 'renders the #show view' do
      question = FactoryBot.create(:question)
      get :show, params: { id: question.id }, format: :json

      expect(response.response_code).to be(200)
    end
  end
end
