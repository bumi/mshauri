# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::IterationsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  before do
    request.env['HTTP_ACCEPT'] = 'application/json'
  end

  describe 'GET' do
    it 'renders the #index view' do
      get :index, params: { user_slug: user.slug }
      assert_response :success
      # response.should render_template :show
    end

    it 'renders the #show view' do
      iteration = user.iterations.create
      get :show, id: iteration, params: { user_slug: user.slug }
      assert_response :success
      # response.should render_template :show
    end
  end
end
