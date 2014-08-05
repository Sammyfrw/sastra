Rails.application.routes.draw do

require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

  resource :contacts, only: [:show]
  resource :abouts, only: [:show]
  resource :settings, only: [:show]

  resources :books, only: [:show]
  resources :showcases, only: [:show]
  resources :showcase_books, only: [:show]
  resources :snippets, only: [:show]
  resources :partners, only: [:show]
  resources :announcements, only: [:show]
  resources :feeds, only: [:show]

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :show, :create] do
    resources :shouts, only: [:create, :destroy]
    resource :bookmarkers, only: [:show]
    resource :bookmarked_users, only: [:show]
    resource :bookmark_relationship, only: [:create, :destroy]
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
