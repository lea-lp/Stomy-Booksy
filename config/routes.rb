Rails.application.routes.draw do
  get 'user_pages/show_profile'
  get 'user_pages/edit_profile'
  get 'user_pages/dashboard'
  devise_for :establishments
  devise_for :teachers
  devise_for :students
  root 'home#index'
  resources :students, only: [:show, :edit]
  resources :teachers, only: [:show, :edit] do
    resources :teacher_establishments, only: [:destroy]
    resources :teacher_cats, only: [:destroy]
  end
  resources :establishments, only: [:show, :edit]
  delete '/establishments/:establishment_id/teachers/:teacher_id', to: 'establishments#destroy_relation_teach_esta', as: :destroy_relation_teach_esta
  delete '/teachers/:teacher_id/sub_categories/:sub_category_id', to: 'teachers#destroy_relation_teacher_subcat', as: :destroy_relation_teacher_subcat
  resources :resources, only: [:create, :destroy, :edit]
  get '/dashboard', to: 'home#dashboard', as: 'dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
