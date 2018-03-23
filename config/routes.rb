Rails.application.routes.draw do
  resources :competitions
  root 'home#index'
  devise_for :users, controllers: { :omniauth_callbacks => 'users/omniauth_callbacks' }

  get  '/join_competitions/:id'  => 'solutions#join_competition', as: "join_competition"
  post '/join_competitions/:id'  => 'solutions#submit_competition'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
