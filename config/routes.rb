Rails.application.routes.draw do
  resources :workouts, only: [:show] do
    resources :entries, only: [:create], shallow: true do
      post :create_from_nickname
    end
  end
end
