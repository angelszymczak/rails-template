# frozen_string_literal: true

class RegistrationsController < ApplicationController
  def new; end

  def create
    user = User.new(email: params[:email], password: params[:password])
    user.save

    respond_to do |format|
      format.html { render template: 'users/show', locals: { user: user }, status: :created }
    end
  end
end
