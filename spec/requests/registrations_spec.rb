# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Registrations' do
  describe 'GET /signup' do
    it 'returns http OK' do
      get '/signup'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /signup' do
    it 'returns http CREATED' do
      post '/signup', params: { user: attributes_for(:user) }
      expect(response).to have_http_status(:created)
    end
  end
end
