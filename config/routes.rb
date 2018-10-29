Rails.application.routes.draw do

  get 'admin/index'
  # Prevent users new registrations
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations' 
  },skip:  [:registrations] 
  as :user do
    get 'users/edit', to: 'devise/registrations#edit', as: 'edit_user_registration'
    put 'users', to: 'devise/registrations#update', as: 'user_registration'
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
