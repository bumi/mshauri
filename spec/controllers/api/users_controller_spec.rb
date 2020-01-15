# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::UsersController do
  let(:user) { FactoryBot.create(:user) }

  describe 'GET #index' do
    it 'renders the :index view' do
      get :index, params: { user_id: user.id }
      #   response.should render_template :index
      response.response_code.should == 200
    end

    it 'renders the #show view' do
      @user = FactoryBot.create(:user)
      #   get :show, params: { id: FactoryBot.create(:user) }
      #   response.should render_template :show
      get :show, params: { id: @user.to_param, template: 'users/show' }
      expect(response).to render_template :show
      response.response_code.should == 200
    end
  end
end
