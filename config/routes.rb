Rails.application.routes.draw do
  resources :workouts, only: [] do
    resources :entries, only: [:index, :create], shallow: true do
      post :create_from_nickname
    end
  end
end
