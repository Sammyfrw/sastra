require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  resource :contacts, only: [:show]
  resource :abouts, only: [:show]
  resource :settings, only: [:show, :update] do
    resource :admin_settings, only: [:update]
    resource :lock_users, only: [:update]
  end
  resource :search, only: [:show]
  resource :lock, only: [:show]
  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:show, :new, :create] do
    resources :announcements, only: [:index]
    resources :shouts, only: [:create, :destroy]
    resource :bookmarkers, only: [:show]
    resource :bookmarked_users, only: [:show]
    resource :bookmark_relationship, only: [:create, :destroy]
    resources :partner_relationships, only: [:create, :destroy] do
      resource :partner_approval, only: [:create]
      resource :partner_denial, only: [:create]
    end
    resource :showcase, only: [:show]
    resource :profile, only: [:show, :new, :create, :edit, :update]
    resources :flags, only: [:create, :destroy]
  end

  resources :feeds, only: [:show]

  resources :books do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
    resources :flags, only: [:create, :destroy]
  end

  resources :snippets, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :partner_relationships, only: [:new]
  resources :partners, only: [:show]

  resources :announcements, only: [:show, :new, :create, :edit,
                                   :update, :destroy] do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
    resources :flags, only: [:create, :destroy]
  end

  get "/sign_up" => "users#new", as: :sign_up
  get "/sign_in" => "sessions#new", as: :sign_in
  get "/sign_out" => "sessions#destroy", as: :sign_out
  get "/locked" => "lock#show", as: :locked_user

constraints Monban::Constraints::SignedIn.new do
  root to: "dashboards#new", as: :dashboard do
    get ':name', to: 'users#show', as: :user
  end
end

  root to: "sessions#new"
end
