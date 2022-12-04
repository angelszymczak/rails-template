# frozen_string_literal: true

class RegistrationsController < ApplicationController
  def new; end

  def create
    logger.info params

    respond_to do |format|
      format.html { render :new, status: :found }
    end
  end
end
