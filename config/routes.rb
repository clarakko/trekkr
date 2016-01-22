Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  post 'challenges/:id/enroll' => "entries#create", as: 'enroll'
  get 'users/:user_id/reports' => "reports#my_reports", as: 'my_reports'

  resources :challenges, only: [:index, :show] do
    resources :treks, only: [:index]
  end

  resources :treks, only: [:index, :show] do
    resources :reports, only: [:new, :create, :show]
  end

  resources :users, only: [] do
    resources :entries, only: [:index]
  end

  resources :entries, only: [:destroy]
end
