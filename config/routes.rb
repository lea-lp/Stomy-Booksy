Rails.application.routes.draw do
  get 'availability_slots/index'
  get 'availability_slots/show'
  get 'availability_slots/edit'
  get 'availability_slots/update'
  get 'availability_slots/new'
  get 'availability_slots/create'
  get 'availability_slots/destroy'
  devise_for :establishments
  devise_for :teachers
  devise_for :students

  root 'home#index'
  get '/dashboard', to: 'home#dashboard', as: 'dashboard'

  resources :students, only: [:show, :edit]

  resources :teachers, only: [:show, :edit] do
    resources :availability_slots, only: [:new, :create, :index]
  end

  resources :resources, only: [:show, :create, :destroy, :edit] do
    resources :availability_slots, only: [:new, :create, :index]
  end

  resources :availability_slots, only: [:show, :edit, :update, :destroy]


  resources :establishments, only: [:show, :edit]
  delete '/establishments/:establishment_id/teachers/:teacher_id', to: 'establishments#destroy_relation_teach_esta', as: :destroy_relation_teach_esta



end
