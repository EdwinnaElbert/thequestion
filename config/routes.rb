Rails.application.routes.draw do
  resources :diff_answers
  resources :questions
  resources :answers
  resources :corrections
  devise_for :users
  root 'questions#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
