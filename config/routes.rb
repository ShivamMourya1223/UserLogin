Rails.application.routes.draw do
  resources :posts do
    resources :likes
    resources :comments do 
      resources :likes
    end
  end
  devise_for :users, controllers: { sessions: 'sessions',registrations: 'registrations',:omniauth_callbacks => 'users/omniauth_callbacks' }
  get 'welcome/index'
  root 'welcome#index'
  
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
       devise_scope :user do
         post 'signup' => 'registrations#create'
         post 'signin' => 'sessions#create'
       end
    end
 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
#