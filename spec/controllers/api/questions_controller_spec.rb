# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::QuestionsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  before do
    request.env['HTTP_ACCEPT'] = 'application/json'
  end

  describe 'GET' do
    it 'renders the #show view' do
      question = FactoryBot.create(:question)
      process :show, method: :get, params: { id: question.id }
      assert_response :success
    end
  end
end
