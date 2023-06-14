Rails.application.routes.draw do
  resources :inventories
  resources :productions
  
  root "homes#index"
  get '/view/inventories', to: 'inventories#index', as: 'view_inventories'
  get '/view/productions', to: 'productions#index', as: 'view_productions'
  # get '/inventories/download_csv', to: 'inventories#download_csv', as: 'download_csv'
  delete '/inventories/:id', to: 'inventories#destroy' 

  get '/all_productions', to: 'productions#index', as: 'all_productions'
end
