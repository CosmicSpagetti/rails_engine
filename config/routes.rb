 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index]
    end
  end

  namespace :api do 
    namespace :v1 do 
      resources :invoices, only: [:index]
    end
  end
  
  namespace :api do 
    namespace :v1 do 
      resources :invoice_items, only: [:index]
    end 
  end
end
