# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions' do
  describe 'GET /login' do
    it 'returns http OK' do
      get '/login'
      expect(response).to have_http_status(:ok)
    end
  end
end
