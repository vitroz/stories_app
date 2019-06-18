Rails.application.routes.draw do
  devise_for :users
  resources :stories, except: [:destroy] do
    resources :comments, only: [:create]
    post 'event' => 'stories#update_story_status_event'
  end

  devise_scope :user do
    authenticated :user do
      root 'stories#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

end
