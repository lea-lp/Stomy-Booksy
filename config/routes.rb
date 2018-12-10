Rails.application.routes.draw do
  devise_for :establishments
  devise_for :teachers
  devise_for :students

  root 'home#index'
  resources :students, only: [:show, :edit] do
    get '/dashboard', to: 'students#dashboard', as: 'dashboard'
  end

  resources :teachers, only: [:show, :edit] do
    get '/dashboard', to: 'teachers#dashboard', as: 'dashboard'
    resources :teacher_establishments, only: [:destroy]
    resources :teacher_cats, only: [:create, :destroy]
    # resources :availability_slots, only: [:new, :create, :index]
  end
  resources :establishments, only: [:index, :show, :edit] do
    resources :teacher_establishments, only: [:create]
    resources :teachers, only: [:index]
    get '/dashboard', to: 'establishments#dashboard', as: 'dashboard'

  end

  resources :resources, only: [:show, :create, :destroy, :edit] do
    resources :availability_slots, only: [:new, :create, :index]
    resources :teachers, only: [:show] do
      resources :events, only: [:index, :create]
    end
  end

  resources :events, only: [:show, :edit]

  # resources :availability_slots, only: [:show, :edit, :update, :destroy]
end
