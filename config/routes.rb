Rails.application.routes.draw do
  root 'auctions#index'
  post '/auctions/:auction_id/publish', to: 'transitions#create_publish', as: 'publish'
  post '/auctions/:auction_id/cancel', to: 'transitions#create_cancel', as: 'cancel'
  post '/auctions/:auction_id/met', to: 'transitions#create_met', as: 'met'
  post '/auctions/:auction_id/not-met', to: 'transitions#create_not_met', as: 'not_met'
  post '/auctions/:auction_id/win', to: 'transitions#create_win', as: 'win'
  post '/auctions/:auction_id/draft', to: 'transitions#create_draft', as: 'draft'

  resources :users, only: [:new, :create] do
    resources :bids, only: :index
  end
  resources :auctions, shallow: true do
    resources :bids
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
