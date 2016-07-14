Rails.application.routes.draw do

  devise_for :admins, :path => '', :path_names => {:sign_in => 'getin', :sign_out => 'logout', :sign_up => 'ahlan_tars'}
  resources :articles

  get 'about'     => 'pages#about'
  get 'services'  => 'pages#services'
  get 'projects'  => 'pages#projects'
end
