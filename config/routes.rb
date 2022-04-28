Rails.application.routes.draw do
  devise_for :users
  resources :resumes, only: [:index, :new, :create, :destroy, :update, :edit, :show]
  root "resumes#index"
end
