require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  resource :contacts, only: [:show]
  resource :abouts, only: [:show]

  resources :feeds, only: [:show]
  resources :snippets, only: [:show, :new, :create, :edit, :update, :destroy]

  resources :partner_relationships, only: [:new]
  resources :partners, only: [:show]

  resources :books, only: [:index, :show, :new, :create, :edit, :update] do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :announcements, only: [:show, :new, :create, :edit,
                            :update, :destroy] do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
  end

  resource :settings, only: [:show, :update]

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:show, :new, :create, :update] do
    resources :announcements, only: [:index]
    resources :shouts, only: [:create, :destroy]
    resource :bookmarkers, only: [:show]
    resource :bookmarked_users, only: [:show]
    resource :bookmark_relationship, only: [:create, :destroy]
    resources :partner_relationships, only: [:create, :destroy]
    resource :showcase, only: [:show]
    resource :profile, only: [:show, :new, :create, :edit, :update]
  end

  get "/sign_up" => "users#new", as: :sign_up
  get "/sign_in" => "sessions#new", as: :sign_in
  get "/sign_out" => "sessions#destroy", as: :sign_out

constraints Monban::Constraints::SignedIn.new do
  root to: "dashboards#new", as: :dashboard do
    get ':name', to: 'users#show', as: :user
  end
end

  root to: "sessions#new"
end
