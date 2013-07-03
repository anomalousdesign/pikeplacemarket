class StaticController < ApplicationController
	
  caches_action :show, :unless => Proc.new{|x| x.current_admin.present? }, :expires_in => 1.hour

  def signup
  	Subscriber.create name: "#{params[:first_name]} #{params[:last_name]}", email: params[:email]
  end

end
