# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])

    if User.authenticate(@user, user_params[:password])
      session[:token] = JWT.encode({ user_id: @user.id }, Rails.application.secrets.secret_key_base, 'HS256')

      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
