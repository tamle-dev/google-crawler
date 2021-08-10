Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dashboards#index'

  namespace :api do
    get :version, to: 'application#version'
    
    namespace :v1 do
      post 'attachments', to: 'create_attachment#call'
    end
  end

  scope '/' do
    resources :dashboards

    resources :attachments
    resources :user_form_attachments, path: :attachments

    resources :keywords
    resources :user_form_keywords, path: :keywords
  end
end
