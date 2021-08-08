Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dashboards#index'

  scope '/' do
    resources :dashboards
  end

  get :version, to: 'application#version'
end
