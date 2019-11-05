Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboards#index'
  resources :members
  resources :meals
  resources :deposits
  resources :expenses
  resources :totalcalculations
  resources :billings
  resources :dashboards
end
