Rails.application.routes.draw do

  # root to: 'pages#home', id: 'home' is set in /initializer/high_voltage.rb
  # get "/pages/*id" => 'pages#show', as: :page, format: false
  
  get '/about'     => 'high_voltage/pages#show', id: 'about'
  get '/services'  => 'high_voltage/pages#show', id: 'services'
  get '/projects'  => 'high_voltage/pages#show', id: 'projects'
end
