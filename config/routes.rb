Rails.application.routes.draw do
  get 'services/index'
  get 'services/show'
  devise_for :establishments
  devise_for :teachers
  devise_for :students

  root 'home#index'

  resources :students, only: [:show, :edit] do
    get '/dashboard', to: 'students#dashboard', as: 'dashboard'
  end

  resources :teachers, only: [:index, :show, :edit] do
    resources :establishments, only: [:index]
    resources :services, only: [:index]
    resources :teacher_cats, only: [:create, :destroy]
    get '/dashboard', to: 'teachers#dashboard', as: 'dashboard'
  end
  
  resources :establishments, only: [:index, :show, :edit] do
    resources :teachers, only: [:index]
    resources :services, only: [:index]
    get '/dashboard', to: 'establishments#dashboard', as: 'dashboard'

  end

  resources :resources, only: [:show, :create, :destroy, :edit] do
    resources :teachers, only: [:show] do
      resources :events, only: [:index, :create]
    end
  end

  resources :services, only: [:index, :create, :destroy]

  resources :events, only: [:show, :edit, :destroy]

end
