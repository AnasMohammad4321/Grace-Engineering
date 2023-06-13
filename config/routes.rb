Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :inventories

  root "homes#index"
  get '/view/inventories', to: 'inventories#index', as: 'view_inventories'
  # delete
  # get '/inventories/:id', to: 'inventories#show', as: 'inventory'
  # get '/inventories/:id/edit', to: 'inventories#edit', as: 'edit_inventory'
  # patch '/inventories/:id', to: 'inventories#update'
  delete '/inventories/:id', to: 'inventories#destroy'


end
