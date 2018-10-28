Rails.application.routes.draw do

  # Prevent users new registrations
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations' 
  },skip:  [:registrations] 
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end


  # Prevent admins new registrations
  devise_for :admins, path: 'admin', controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations' }, skip:  [:registrations] 
  as :admin do
    get 'admins/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'
    put 'admins' => 'devise/registrations#update', :as => 'admin_registration'
  end

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
