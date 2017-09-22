Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  root to: 'pages#home'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :countries
  resources :guides
  resources :reviews, only: [ :show, :edit, :update, :destroy ]
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :countries, only: [ :index ]
    end
  end
  resources :conversations do
    resources :messages
  end
  get 'check', to: 'guides#check_in'
  get 'mark_as_read', to: 'conversations#mark_as_read_own'
    resources :guides do
    resources :reviews, only: [ :index, :new, :create ]
  end

  get 'pages/a_savoir'
  get 'pages/add_country'
  get "informations/download_csv"
  get "informations/download_xlsx"
  get "/informations/import_guides" => "informations#import_guides"
  post "informations/import_csv" => "informations#import_csv"
  post "informations/import_xlsx" => "informations#import_xlsx"





end
