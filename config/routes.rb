Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :brands, only: [] do
    collection do
      get 'explore'
      get 'saved'
      get 'local'
      get 'new'
      post 'explore'
    end
  end

  get 'brands/naughty/:id', to: 'brands#naughty', as: 'naughty_brand'
  get 'brands/ecofriendly/:id', to: 'brands#ecofriendly', as: 'ecofriendly_brand'
  get 'my_impact', to: 'users#my_impact'
  post 'brands/:id/saved', to: 'brands#save', as: 'save'
  get 'brands/ecofriendly/:id/share', to: 'brands#share', as: 'share_brand'
end
