Rails.application.routes.draw do
get "produtos/search", to: "produtos#search", as: :search_produto
resources :produtos, only: [:new, :create, :destroy]
root to: "produtos#index"
end
