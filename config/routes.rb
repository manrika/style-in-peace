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

  get 'brands/naughty/:id', to: 'brands#naughty'
  get 'brands/ecofriendly/:id', to: 'brands#ecofriendly'
  get 'my_impact', to: 'users#my_impact'
end
