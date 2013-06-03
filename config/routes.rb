PikeplacemarketOrg::Application.routes.draw do

  devise_for :admins

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  mount Editables::Engine, at: "/editables"

  resources :pages, only: [:show]
  resources :merchants, :path => "/directory", only: [:show, :index]
  resources :events, only: [:show, :index]

  root :to => "static#home"

end
