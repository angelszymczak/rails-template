# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @current_user = User.new
  end

  def create
    @current_user = User.auth(user_params)

    respond_to do |format|
      if @current_user
        format.html { render 'welcome/index', status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
