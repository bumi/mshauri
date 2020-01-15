# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::QuestionsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  describe 'GET' do
    it 'renders the #show view' do
      get :show, params: { id: FactoryBot.create(:question) }
      response.should render_template :show
    end
  end
end
