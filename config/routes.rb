Rails.application.routes.draw do
  # TODO Set authenticated path and set it on app/controllers/concern/accessible.rb
  # set only routes for sessions
  devise_for :users, path: 'users', controllers: { sessions: 'users/sessions' }


  devise_for :admins, path: 'admin', controllers: { sessions: 'admins/sessions' }

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
