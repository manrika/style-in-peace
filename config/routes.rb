Rails.application.routes.draw do
  devise_for :users
  root to: 'brands#home'

  get 'naughty/:id', to: 'brands#naughty'
  get 'ecofriendly/:id', to: 'brands#ecofriendly'
  get 'explore', to: 'brands#explore'
  get 'saved', to: 'brands#saved'
  get 'local', to: 'brands#local'
  get 'my_impact', to: 'users#my_impact'

  get 'explore/new', to: 'brands#new'
  post 'explore', to: 'brands#create'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
