Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'weights#index'
  resources :weights
  resources :calories
  resources :workouts
  resources :foods
  resources :fastings
  resources :meals do
    resources :meal_foods
  end
end
