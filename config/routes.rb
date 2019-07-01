 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :customers do 
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
      end

      namespace :invoices do 
        get '/find', to: "search#show"
        get '/find_all', to: 'search#index'
      end

      namespace :invoice_items do 
        get '/find', to: "search#show"
        get '/find_all', to: 'search#index'
      end

      namespace :items do 
        get '/find', to: "search#show"
        get '/find_all', to: 'search#index'
      end

      namespace :merchants do 
        get '/find', to: "search#show"
        get '/find_all', to: 'search#index'
        get '/most_revenue', to: 'most_revenue#index'
        get '/most_items', to: 'most_items#index'
        get '/revenue', to: 'revenue#index'
        get '/:id/revenue/', to: 'revenue#show'
      end

      namespace :transactions do 
        get '/find', to: "search#show"
        get '/find_all', to: 'search#index'
      end

      resources :invoices, only: [:index, :show], module: :invoices do 
        resources :transactions, only: :index
        resources :items, only: :index
        resources :invoice_items, only: :index
        resources :customer, only: :index
        resources :merchant, only: :index
      end

      resources :customers, only: [:index, :show], module: :customers do 
        resources :invoices, only: :index 
        resources :transactions, only: :index
      end
     

      resources :invoice_items, only: [:index, :show], module: :invoice_items do 
        resources :item, only: :index
        resources :invoice, only: :index
      end

      resources :items, only: [:index, :show], module: :items do 
        resources :invoice_items, only: :index
        resources :merchant, only: :index
      end

      resources :merchants, only: [:index, :show], module: :merchants do 
        resources :items, only: [:index]
        resources :invoices, only: [:index]
      end  

      resources :transactions, only: [:index, :show], module: :transactions do 
        resources :invoice, only: :index
      end
    end
  end
end