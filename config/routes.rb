# frozen_string_literal: true

Rails.application.routes.draw do

  get '/signup', controller: :registrations, action: :new
  post '/signup', controller: :registrations, action: :create

  get '/login', controller: :sessions, action: :new
  post '/login', controller: :sessions, action: :create
  delete '/login', controller: :sessions, action: :destroy

end
