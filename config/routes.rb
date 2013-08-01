PikeplacemarketOrg::Application.routes.draw do

  get '/news_events/pc1north', to: redirect('/pages/pc-1-north-rfp-rfq')
  get '/visitor_info/hours', to: redirect('/pages/hours-calendar')
  get '/explore_the_market', to: redirect('/pages/explore-the-market')

  get 'clear-cache' => "application#clear_cache"

  devise_for :admins

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  mount Editables::Engine, at: "/editables"

  resources :pages, only: [:show]
  resources :merchants, :path => "/directory", only: [:show, :index]
  resources :events, only: [:show, :index, :create]

  post "signup" => "static#signup"

  root :to => "static#home"

  match '/*paths' => redirect('/') # any unfound paths will redirect home

end
