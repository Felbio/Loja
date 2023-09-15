Rails.application.routes.draw do
  resources :departments
  get "produtos/search", to: "produtos#search", as: :search_produto
  resources :produtos, only: [:new, :create, :destroy, :edit, :update]
  root to: "produtos#index"
end
