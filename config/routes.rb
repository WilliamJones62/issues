Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/signout', to: 'devise/sessions#destroy', as: :signout
  end
  get 'complaints/showimage/:id'  => 'complaints#showimage'
  get 'complaints/source'
  get 'complaints/closed'
  get 'complaints/closedlist'
  resources :complaints do
    resources :complaints_parts, except: [:index, :show]
    resources :complaints_images, except: [:index, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'complaints#source'
end
