# frozen_string_literal: true

class WelcomeController < ApplicationController
  before_action :authenticate_request, only: [:index]

  attr_reader :current_user

  def index
    # Bearer AUTH_TOKEN could can come from headers or cookies
    token = cookies[:token] || request.headers['Authorization']

    respond_to do |format|
      if (@current_user = AuthenticateRequest.call(token))
        format.html { render 'index' }
      else
        redirect_to login_path
      end
    end
  end
end
