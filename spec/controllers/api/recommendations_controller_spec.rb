# frozen_string_literal: true

require 'rails_helper'

describe Api::RecommendationsController, type: :controller do
  # describe Api::RecommendationsController do
  let(:user) { FactoryBot.create(:user) }

  # describe 'GET #index' do
  #   it 'renders the :index view' do
  #     user = FactoryBot.create(:user)
  #     get :show, params: { user_slug: user.slug }
  #     # expect(response.status).to eq(200)
  #     # response.should render_template :index
  #   end
  # end

  describe 'GET' do
    it 'renders the #show view' do
      recommendation = FactoryBot.create(:recommendation)
      get :show, params: { id: recommendation.id }
      response.should render_template :show
    end
  end
end
