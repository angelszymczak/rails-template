# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions' do
  describe 'GET /login' do
    it 'returns http OK' do
      get '/login'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /login' do
    before { create(:user, user_params) }

    let(:user_params) { attributes_for(:user) }

    it 'returns http FOUND' do
      post '/login', params: { user: user_params }
      expect(response).to have_http_status(:found)
    end
  end
end
