# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::UsersController do
  let(:user) { FactoryBot.create(:user) }

  describe 'GET #index' do
    it 'renders the :index view' do
      user = FactoryBot.create(:user)
      get :me, params: { user_slug: user.slug }
      expect(response.status).to eq(200)
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end
  end
end
