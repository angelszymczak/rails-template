# frozen_string_literal: true

class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.save

    respond_to do |format|
      format.html { render template: 'users/show', locals: { user: user }, status: :created }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
