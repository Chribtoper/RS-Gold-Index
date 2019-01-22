Rails.application.routes.draw do
  resources :sites do
    resources :prices
  end
end
