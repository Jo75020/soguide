Rails.application.routes.draw do
ActiveAdmin.routes(self)
mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                    new: 'users/new' }
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
  post "check" => 'guides#check_in'

  get 'mark_as_read', to: 'conversations#mark_as_read_own'
    resources :guides do
    resources :reviews, only: [ :index, :new, :create ]
  end

  get 'pages/a_savoir'
  get 'pages/add_country'
  get "informations/download_csv"
  get "informations/download_xlsx"
  get "/informations/import_soguide" => "informations#import_soguide"
  post "informations/import_guides_xlsx" => "informations#import_guides_xlsx"
  post "informations/import_reviews_xlsx" => "informations#import_reviews_xlsx"
end
