# frozen_string_literal: true

require 'rails_helper'

describe Api::RecommendationsController, type: :controller do
  # describe Api::RecommendationsController do
  let(:user) { FactoryBot.create(:user) }

  describe 'GET #all' do
    it 'renders the :index view' do
      user = FactoryBot.create(:user)
      get :all, params: { user_slug: user.slug }, format: :json
      # expect(response.status).to eq(200)
      # response.should render_template :index
    end
  end

  describe 'GET' do
    it 'renders the #show view' do
      recommendation = FactoryBot.create(:recommendation)
      get :show, params: { id: recommendation.id }, format: :json
      # response.should render_template :show
      assert_response :success
    end
  end
end
