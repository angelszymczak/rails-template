# frozen_string_literal: true

Rails.application.routes.draw do

  get 'welcome', controller: :welcome, action: :index
  root to: 'welcome#index'

  get '/signup', controller: :registrations, action: :new
  post '/signup', controller: :registrations, action: :create

  get '/login', controller: :sessions, action: :new
  post '/login', controller: :sessions, action: :create

end
