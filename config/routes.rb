Rails.application.routes.draw do
  get 'piczka/index'
  # # get 'signs/new'
  # get 'neweruser/new'
  # get 'users/new'
  # resources :users
  get 'witaj/index'
  root to: 'articles#index'
  #   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :articles do
    resources :comments
  end

  get 'nauka' => 'home#learn', as: :learn
  get 'cwiczenia' => 'home#practice', as: :practice
  get 'wdrozenia' => 'users#index', as: :implementation
  get 'kontakt' => 'home#contact', as: :contact
  # get 'devise' => 'users#index'
  get '/signs' => 'signs#new'
  post '/signs' => 'signs#create'
  resources :signs
end
