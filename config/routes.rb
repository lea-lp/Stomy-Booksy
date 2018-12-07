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

  resources :events, only: [:show, :edit]

  resources :resources, only: [:show, :create, :destroy, :edit] do
    resources :availability_slots, only: [:new, :create, :index]
    resources :teachers do
      resources :events, only: [:index, :create]
    end
  end

  resources :availability_slots, only: [:show, :edit, :update, :destroy]


  resources :establishments, only: [:index, :show, :edit] do
    get '/teachers/', to: 'establishments#index_of_teachers', as: :teachers_index
  end
  
  delete '/establishments/:establishment_id/teachers/:teacher_id', to: 'establishments#destroy_relation_teach_esta', as: :destroy_relation_teach_esta

end
