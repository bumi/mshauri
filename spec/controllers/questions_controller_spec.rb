# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QuestionsController do
  let(:user) { FactoryBot.create(:user) }

  describe 'GET #index' do
    it 'renders the :index view' do
      get :index
      response.should render_template :index
    end

    it 'renders the #show view' do
      get :show, params: { id: FactoryBot.create(:question) }
      response.should render_template :show
    end
  end
end
