Rails.application.routes.draw do
  devise_for :users
  
  resources :users do
    collection do
     get 'settings'
     post 'update_settings'
    end
  end
  resources :welcome do
	get 'index', on: :collection
  end
  root 'welcome#index'
  resources :leave_requests do
	  member do
      post 'respond_request'
    end
  end 
end