Rails.application.routes.draw do
  devise_for :establishments
  devise_for :teachers
  devise_for :students
  root 'home#index'
  resources :students, only: [:show, :edit]
  resources :teachers, only: [:show, :edit]
  resources :establishments, only: [:show, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
