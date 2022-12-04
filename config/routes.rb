# frozen_string_literal: true

Rails.application.routes.draw do
  get '/signup', controller: :registrations, action: :new
end
