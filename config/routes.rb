Rails.application.routes.draw do
  get '/inventories/add_existing', to: 'inventories#add_existing', as: 'add_existing_inventories'
  patch '/inventories/update', to: 'inventories#update', as: 'update_inventory'
  get '/inventories/download_csv', to: 'inventories#download_csv', as: 'download_csv'
  get "/production/download_csv", to: "productions#download_csv", as: "download_production_csv"

  resources :inventories do
    collection do
      get '/inventories/download_csv', to: 'inventories#download_csv', as: 'download_csv'
    end
  end
  resources :productions
  
  root "homes#index"
  get '/view', to: 'homes#index', as: 'view'
  get '/view/inventories', to: 'inventories#index', as: 'view_inventories'
  get '/view/productions', to: 'productions#index', as: 'view_productions'


  # get '/inventories/download_csv', to: 'inventories#download_csv', as: 'download_csv'
  # delete '/inventories/:id', to: 'inventories#destroy' 
  # get '/inventories/existing', to: 'inventories#existing', as: 'existing_inventories'
  # post '/inventories/existing', to: 'inventories#update_existing', as: 'update_existing_inventories'
  # # Move this route below the download_csv route
  # get '/view/inventories/:id', to: 'inventories#show', as: 'view_inventory'
end
