require 'sidekiq/web'
require 'sidekiq/cron/web'

Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  [user, password] == [ENV['SIDEKIQ_USERNAME'], ENV['SIDEKIQ_PASSWORD']]
end

Rails.application.routes.draw do
  mount Sidekiq::Web, at: 'debugs/sidekiq' # mount to debugs/sidekiq
  mount Iconsole::Engine, at: 'debugs' # mount to debugs/iconsole

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dashboards#index'

  namespace :api do
    get :version, to: 'application#version'

    namespace :v1 do
      post 'users/login', to: 'login#call'

      post 'attachments', to: 'create_attachment#call'

      get 'keywords', to: 'get_keywords#call'
      get 'keywords/:id', to: 'get_keyword#call'
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
