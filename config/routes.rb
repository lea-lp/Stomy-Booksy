Rails.application.routes.draw do
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
    resources :teachers do
      resources :events, only: [:show, :index, :create]
    end
  end

  resources :availability_slots, only: [:show, :edit, :update, :destroy]


  resources :establishments, only: [:show, :edit]
  
  delete '/establishments/:establishment_id/teachers/:teacher_id', to: 'establishments#destroy_relation_teach_esta', as: :destroy_relation_teach_esta

end
