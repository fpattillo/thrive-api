Rails.application.routes.draw do
  # Nested routes for accessing tasks, subtasks, and tags in the context of periods and tasks
  resources :periods do
    resources :tasks do
      resources :subtasks, only: [:index, :new, :create, :edit, :update, :destroy]
      resources :tags, only: [:index, :new, :create, :edit, :update, :destroy]
    end
  end

  # Standalone routes for tasks, subtasks, and tags
  resources :tasks do
    resources :subtasks, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :tags, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :subtasks, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :tags, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
