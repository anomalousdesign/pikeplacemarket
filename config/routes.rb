PikeplacemarketOrg::Application.routes.draw do

  devise_for :admins

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  root :to => "static#home"

end
