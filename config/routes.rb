Rails.application.routes.draw do

  resources :companies do
    resources :contacts, only: [:new, :create, :edit, :update, :destroy]
    resources :campaigns, only: [:show, :new, :create, :edit, :update, :destroy]
  end

  resources :users
  # Prevent users new registrations
  devise_for :users, path: 'user', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations' 
  },skip:  [:registrations] 
  as :user do
    get 'user/edit', to: 'users/registrations#edit', as: 'edit_user_registration'
    put 'user', to: 'users/registrations#update', as: 'user_registration'
  end
  authenticated :user do
    root 'home#index', as: :authenticated_user_root
  end


  # Prevent admins new registrations
  devise_for :admins, path: 'admin', controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations' }, skip:  [:registrations] 
  as :admin do
    get 'admins/edit', to: 'admins/registrations#edit', as: 'edit_admin_registration'
    put 'admins', to: 'admins/registrations#update', as: 'admin_registration'
  end

  authenticated :admin do
    root 'admin#index', as: :authenticated_admin_root
  end

  root 'home#index'
end
