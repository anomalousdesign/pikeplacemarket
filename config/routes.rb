PikeplacemarketOrg::Application.routes.draw do

  get '/news_events/pc1north', to: redirect('/pages/pc-1-north-rfp-rfq')
  get '/visitor_info/hours', to: redirect('/market-events')
  get '/explore_the_market', to: redirect('/pages/explore-the-market')
  get '/events/magic-in-the-market', to: redirect('/events/magic-in-the-market-holiday-celebration')
  get '/waterfront-entrance', to: redirect('/marketfront')
  get '/waterfront-entrance-faq', to: redirect('/marketfront-faq')
  get '/waterfront-entrance-documents', to: redirect('/marketfront-documents')
  get '/then_and_now', :to => redirect('/then_and-now/index.html')

  get 'clear-cache' => "application#clear_cache"

  devise_for :admins

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  mount Editables::Engine, at: "/editables"

  resources :pages, only: [:show]
  resources :merchants, :path => "/directory", only: [:show, :index]
  resources :events, only: [:show, :index, :create]

  post "signup" => "static#signup"

  root :to => "static#home"

  get ":id" => "pages#show"
  
  match '/*paths' => redirect('/') # any unfound paths will redirect home

end