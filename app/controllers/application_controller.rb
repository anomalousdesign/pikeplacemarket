class ApplicationController < ActionController::Base
  protect_from_forgery
  helper Editables::Engine.helpers

  def clear_cache
  	if current_admin
	  	Rails.cache.clear
	  	render text: "Server Cache Cleared"
	  else
	  	redirect_to "/"
	  end
  end

end
