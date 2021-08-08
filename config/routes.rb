Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'dashboards#index'

  get :version, to: 'application#version'
end
