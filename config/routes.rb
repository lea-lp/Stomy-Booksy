Rails.application.routes.draw do
  get 'students/show'
  get 'students/edit'
  get 'teachers/show'
  get 'teachers/edit'
  get 'establishments/show'
  get 'establishments/edit'
  get 'user_pages/show'
  get 'user_pages/edit'
  get 'user_pages/dashboard'
  devise_for :establishments
  devise_for :teachers
  devise_for :students
  root 'home#index'
  resources :students, only: [:show, :edit]
  resources :teachers, only: [:show, :edit]
  resources :establishments, only: [:show, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
