Rails.application.routes.draw do

  # root to: 'pages#home', id: 'home' is set in /initializer/high_voltage.rb
  # get "/pages/*id" => 'pages#show', as: :page, format: false
  # if routing the root path, update for your controller

  get "/pages/*id"      => 'pages#show',              as: :page, format: false
  get 'pages/home'      => 'high_voltage/pages#show', id: 'home'
  get 'pages/about'     => 'high_voltage/pages#show', id: 'about'
  get 'pages/services'  => 'high_voltage/pages#show', id: 'services'
  get 'pages/projects'  => 'high_voltage/pages#show', id: 'projects'
end
