Rails.application.routes.draw do

  resources :earthquakes, only: [:index, :show] do
    get :search, on: :collection
  end

end
