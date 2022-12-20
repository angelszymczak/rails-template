# frozen_string_literal: true

Rails.application.routes.draw do

  get '/signup', controller: :registrations, action: :new
  post '/signup', controller: :registrations, action: :create

  get '/login', controller: :sessions, action: :new

end
